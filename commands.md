# Linux CLI Commands Reference

## `ln` — Symbolic Links ("Shortcuts")

**Syntax:** `ln -s <existing_target> <link_name>`

- First argument: the real file/directory that already exists (the "source")
- Second argument: the name/location of the shortcut you want to create (the "destination")

Example: create a symlink `work-docs` pointing to `~/Documents/projects/work`:
```bash
ln -s ~/Documents/projects/work work-docs
```

Common pitfalls:
- Omitting `-s` creates a hard link (not a shortcut, cannot link directories, behaves differently)
- Swapping the arguments creates a broken link (or overwrites existing files if the second argument already exists)

Mnemonic: Same order as `cp`/`mv`: existing source first, new destination second.

---

## `grep`, `awk`, `cut`, `sed` — Practical Reference

### Your own dotfile patterns (real usage)

| Command | Usage in your repo |
|---------|-------------------|
| `grep -qx` | Exact match in conditionals: `docker ps ... | grep -qx "$container_name"` |
| `grep -E` | Extended regex + awk summing: `grep -E "brew\|homebrew" file | awk '{sum += $1} END {print sum}'` |
| `grep -v` | Exclude lines: `tmux list-session | grep -v "$current"` |
| `grep --line-buffered` | Streaming pipes: `... | grep --line-buffered '^{' | ...` |
| `cut -c1-8` | First N chars of a hash: `sha1sum | cut -c1-8` |
| `cut -d ':' -f 1` | Field by delimiter: `tmux ls | cut -d ':' -f 1` |
| `awk '{sum += $1} END {print sum}'` | Sum a column |
| `awk '{print $2}'` | Print specific column (e.g. PID from `ps -ef`) |
| `sed 1d` | Delete first line (strip header from `ps -ef`) |

---

### `grep` — Search text patterns

**Syntax:** `grep [OPTIONS] PATTERN [FILE...]`

| Flag | Purpose |
|------|---------|
| `-i` | Case-insensitive |
| `-n` | Show line numbers |
| `-v` | Invert match (exclude lines) |
| `-R`/`-r` | Recursive directory search |
| `-F` | Fixed string (no regex) |
| `-E` | Extended regex (same as `egrep`) |
| `-l` | Print filenames only |
| `--color=auto` | Highlight matches |

**Daily examples:**
```bash
grep 'error' app.log                          # basic search
grep -Rn 'TODO' src/                          # recursive with line numbers
grep -v '^#' config.conf | grep -v '^$'      # skip comments and blank lines
ps aux | grep -v grep | grep nginx            # exclude grep itself from process search
grep -E 'warn|error|fatal' app.log           # multiple patterns
```

---

### `awk` — Column processing / mini scripting

**Syntax:** `awk 'pattern { action }' [FILE...]`

| Concept | Usage |
|---------|-------|
| `$1, $2, ...` | Fields (columns) by whitespace |
| `$NF` | Last field |
| `NF` | Number of fields in current line |
| `FS` | Input field separator |
| `BEGIN{}` / `END{}` | Run before/after processing |
| `-F:` | Set delimiter to colon |

**Daily examples:**
```bash
awk '{print $1}' access.log                    # print first column
awk -F: '{print $1, $3}' /etc/passwd         # colon-delimited, print user + UID
awk '{sum += $1} END {print sum}' nums.txt    # sum a column
awk '$3 > 100 {print $0}' data.txt            # filter: print lines where column 3 > 100
ps -ef | awk '{print $2}'                     # extract PIDs
```

---

### `cut` — Extract columns by delimiter

**Syntax:** `cut OPTION [FILE...]`

| Option | Purpose |
|--------|---------|
| `-f N` | Field N (1-indexed) |
| `-f 1,3` | Multiple fields |
| `-f 1-3` | Range of fields |
| `-d X` | Delimiter (default: TAB) |
| `-c 1-8` | Character range |
| `--output-delimiter=:` | Change output delimiter |

**Daily examples:**
```bash
cut -f1,3 -d: /etc/passwd                    # fields 1 and 3, colon-delimited
echo 'a:b:c:d' | cut -d: -f2                # second field only
cut -c1-8 hash.txt                           # first 8 characters
cut -f1-3 --output-delimiter=' | ' data.tsv  # reformat output delimiter
```

---

### `sed` — Stream editor (find & replace)

**Syntax:** `sed [OPTIONS] 'command' [FILE...]`

| Command | Purpose |
|---------|---------|
| `s/old/new/` | Substitute first match per line |
| `s/old/new/g` | Substitute all matches per line |
| `s/old/new/gi` | Global + case-insensitive |
| `-i` | Edit file in-place |
| `-i.bak` | In-place with backup |
| `d` | Delete lines matching pattern |
| `1d` | Delete line 1 |

**Daily examples:**
```bash
sed 's/foo/bar/' file.txt                    # replace first occurrence per line
sed 's/foo/bar/g' file.txt                   # replace all occurrences
sed -i 's/old/new/g' file.txt                # in-place edit
sed -i.bak 's/old/new/g' file.txt            # in-place with .bak backup
sed '/^#/d' file.txt                         # delete all comment lines
sed -e 's/a/b/' -e 's/x/y/' file.txt        # multiple expressions
```

> **macOS/BSD note:** `sed -i` requires an argument. Use `sed -i '' 's/old/new/' file` on macOS.

---

## Other high-impact CLI tools

| Tool | Purpose | Example |
|------|---------|---------|
| **ripgrep (`rg`)** | Faster grep, respects `.gitignore` by default | `rg -n 'TODO' src/` |
| **fd** | Simpler/faster `find` | `fd -e js -x eslint {}` |
| **xargs** | Build command lines from stdin | `git ls-files | xargs grep 'TODO'` |
| **jq** | Query/filter JSON | `curl api/status | jq '.services[] | select(.up==false)'` |
| **sort** | Sort lines | `ps aux | sort -k3 -rn | head` (top CPU) |
| **uniq** | Deduplicate adjacent lines (pair with sort) | `history | awk '{print $2}' | sort | uniq -c | sort -rn` |
| **tr** | Character translation/deletion | `echo "hello" | tr 'a-z' 'A-Z'` → `HELLO` |
| **tee** | Write to file + stdout | `make 2>&1 | tee build.log` |
| **wc** | Count lines/words/bytes | `find . -name '*.js' | xargs wc -l` |
| **tree** | Directory structure visualization | `tree -L 2 -I 'node_modules\|dist'` |

Your dotfile repo already uses `rg` (in `cht.sh`), `jq` (in `afk.sh`), and has `tre` aliased — you're most of the way there. The ones to adopt next: **fd** (replaces most `find` usage), **xargs** (pairs perfectly with your grep/awk pipelines), and **jq** more directly for JSON inspection.
