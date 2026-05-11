# CI Checks for Dotfile Repo

## Goal

Add static analysis CI that runs on every push/PR. The repo contains shell scripts, Lua configs, and a Python script — each has a dedicated linter.

---

## Tools by file type

| File type | Tool | Notes |
|-----------|------|-------|
| `*.sh`, `bashrc`, `*.fish` | **shellcheck** | Industry standard for shell; catches unquoted vars, bad substitutions, portability issues. Fish files need `--shell=bash` skipped — shellcheck doesn't support fish syntax, so exclude them. |
| `*.lua` | **luacheck** | Static analyser for Lua; catches unused vars, undefined globals, shadowing. |
| `*.py` | **ruff** | Fast Python linter/formatter check (`ruff check`). |

---

## What to lint

- `install.sh`, `install/*.sh`
- `scripts/*.sh`
- `omarchy/*.sh`, `tmux/*.sh`
- `packages/*.sh`
- `raycast/scripts/*.sh` (exclude `*.py` from shellcheck)
- `shells/bash/bashrc` (treat as bash with `--shell=bash`)
- `raycast/scripts/the-zen-of-python.py`
- `nvim-lua/**/*.lua`

Exclude: `shells/fish/**` (fish syntax is not shellcheck-compatible), `snippets/` (not executable code).

---

## GitHub Actions workflow

File: `.github/workflows/lint.yml`

```yaml
name: Lint

on:
  push:
  pull_request:

jobs:
  shellcheck:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - name: Run shellcheck
        uses: ludeeus/action-shellcheck@master
        with:
          scandir: '.'
          additional_files: 'shells/bash/bashrc'
          ignore_paths: 'shells/fish snippets'
          severity: warning

  luacheck:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - name: Install luacheck
        run: sudo apt-get install -y luarocks && sudo luarocks install luacheck
      - name: Run luacheck
        run: luacheck nvim-lua/ --globals vim

  ruff:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - uses: astral-sh/ruff-action@v3
        with:
          args: check raycast/scripts/the-zen-of-python.py
```

---

## Open questions / decisions needed

1. **Severity threshold for shellcheck** — `warning` catches real bugs but may fire on style nits. `error` is quieter but misses quoting issues. Recommendation: start with `warning`.
2. **luacheck globals** — NvChad/lazy plugins define globals like `vim`. The `--globals vim` flag covers the common case; may need a `.luacheckrc` for plugin-specific globals.
3. **shellcheck directives in existing files** — Some scripts may need `# shellcheck disable=SCxxxx` for intentional patterns (e.g. `eval`-based sourcing). Fix or suppress on a case-by-case basis.
4. **Fish shell** — No widely-adopted CI linter exists for fish. Skip for now; can add `fish --no-execute` as a syntax check if fish is available on the runner.

---

## Implementation steps

1. Create `.github/workflows/lint.yml` with the three jobs above.
2. Run shellcheck locally on all shell files; fix or suppress any existing warnings.
3. Add `.luacheckrc` at repo root to configure globals for the nvim-lua tree.
4. Push and verify all three jobs pass on GitHub Actions.
