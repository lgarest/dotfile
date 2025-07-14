# 📘 VS Code Keybindings Cheatsheet

This cheatsheet contains all your custom VS Code keybindings that mirror your Neovim configuration, using **Space as the leader key**.

## 🎯 How to Use Chord Sequences

For multi-key sequences (like `Space f c`):
1. **Press `Space`** - VS Code shows a brief indicator
2. **Release `Space`**
3. **Press the next key** (e.g., `f` for find operations)
4. **Release and press the final key** (e.g., `c` for current word)

---

## 🔧 General Keybindings

| **Keybinding** | **Action** | **Description** |
|:--------------:|:----------:|:---------------:|
| `Alt+j` | Move lines down | Move current line or selection down |
| `Alt+k` | Move lines up | Move current line or selection up |

---

## 🎯 Leader Key Bindings (Space + ...)

### 📁 File Operations (`Space o`)
| **Keybinding** | **Action** | **Description** |
|:--------------:|:----------:|:---------------:|
| `Space o m` | Open settings | Open VS Code settings.json |
| `Space o n` | Quick open | Open file picker |
| `Space o l` | Extensions | Open extensions panel |
| `Space o s` | Snippets | Open snippets editor |

### 🔄 Git Operations (`Space g`)
| **Keybinding** | **Action** | **Description** |
|:--------------:|:----------:|:---------------:|
| `Space g g` | Git panel | Open source control panel |
| `Space g b` | Git blame | Toggle file blame |
| `Space g d` | Git diff | Open file diff |
| `Space g p` | Preview | Show hover information |
| `Space g l` | Git log | View file history |
| `Space g o` | Git checkout | Checkout branch |
| `Space g r` | References | Find all references |
| `Space g s` | Git status | Open file changes |
| `Space g u` | Commands | Show command palette |

### 🔍 Search/Find Operations (`Space f`)
| **Keybinding** | **Action** | **Description** |
|:--------------:|:----------:|:---------------:|
| `Space f .` | Find files | Quick open files |
| `Space f c` | Find current | Find next match |
| `Space f C` | Commands | Show command palette |
| `Space f d` | Diagnostics | Show problems panel |
| `Space f k` | Keybindings | Open keybindings editor |
| `Space f l` | Find in files | Search across all files |
| `Space f n` | Neovim files | Quick open (general) |
| `Space f o` | Old files | Open recent files |
| `Space f r` | Resume | Switch to previous editor |
| `Space f R` | Registers | Show commands |
| `Space f t` | TODOs | Find in files |
| `Space f g` | Grep | Find in files |
| `Space f j` | Join lines | Join selected lines |
| `Space f B` | Buffer find | Find in files |
| `Space f M` | Symbols | Show all symbols |

### 📋 Code Operations (`Space c`)
| **Keybinding** | **Action** | **Description** |
|:--------------:|:----------:|:---------------:|
| `Space c a` | Code actions | Quick fix menu |
| `Space c b p` | Copy path | Copy relative file path |
| `Space c c p` | Copilot prompts | Open GitHub Copilot chat |
| `Space c c o` | Copilot chat | Open GitHub Copilot chat |

### 🏃 Execution/Runners (`Space r`)
| **Keybinding** | **Action** | **Description** |
|:--------------:|:----------:|:---------------:|
| `Space r x` | Execute | Run selected text in terminal |
| `Space r n` | Run | Start debugging |
| `Space r p` | Format | Format document (prettier) |
| `Space r P` | Format++ | Format document (enhanced) |
| `Space r e` | ESLint | Run ESLint autofix |

### 🎨 UI Toggles (`Space t`)
| **Keybinding** | **Action** | **Description** |
|:--------------:|:----------:|:---------------:|
| `Space t r` | Render chars | Toggle render control characters |
| `Space t s` | Suggestions | Toggle suggestion details |
| `Space t n` | New tab | Create new untitled file |
| `Space t a` | Toggle sidebar | Show/hide sidebar |

### 🔧 Outline/Symbols (`Space o`)
| **Keybinding** | **Action** | **Description** |
|:--------------:|:----------:|:---------------:|
| `Space o f` | Functions | Show document symbols |
| `Space o F` | Workspace funcs | Show workspace symbols |

---

## 🪟 Window Navigation

| **Keybinding** | **Action** | **Description** |
|:--------------:|:----------:|:---------------:|
| `Ctrl+h` | Navigate left | Move to left editor group |
| `Ctrl+j` | Navigate down | Move to editor group below |
| `Ctrl+k` | Navigate up | Move to editor group above |
| `Ctrl+l` | Navigate right | Move to right editor group |
| `Ctrl+f` | New terminal | Open new terminal |
| `Ctrl+s` | Session terminal | Open new terminal |

---

## 📁 File Explorer

| **Keybinding** | **Action** | **Description** |
|:--------------:|:----------:|:---------------:|
| `\e` | Reveal file | Show active file in explorer |
| `\n` | Toggle explorer | Show/hide file explorer |

---

## 🎯 Go-to Operations

| **Keybinding** | **Action** | **Description** |
|:--------------:|:----------:|:---------------:|
| `gs` | Go to split | Open definition in split |
| `gv` | Go to vsplit | Open definition in vertical split |
| `gF` | Go to file | Go to declaration |
| `gw` | Jump window | Quick switch between windows |

---

## 🔀 Conflict Resolution

| **Keybinding** | **Action** | **Description** |
|:--------------:|:----------:|:---------------:|
| `gh` | Accept incoming | Accept incoming changes (in selection) |
| `gl` | Accept current | Accept current changes (in selection) |

---

## 🧭 Navigation

| **Keybinding** | **Action** | **Description** |
|:--------------:|:----------:|:---------------:|
| `[c` | Context | Focus breadcrumbs |

---

## 🚫 Disabled Default Keybindings

These default VS Code keybindings have been disabled to avoid conflicts:

| **Keybinding** | **Original Action** | **Reason** |
|:--------------:|:------------------:|:----------:|
| `Ctrl+n` | New file | Conflicts with navigation |
| `Ctrl+Shift+n` | New window | Conflicts with navigation |

---

## 💡 Tips & Tricks

### 🔄 Vim Mode Integration
- All keybindings work with the standard Vim extension
- Status bar shows current vim mode (NORMAL, INSERT, etc.)
- Icons are properly displayed (fixed from previous issues)

### 🎨 Visual Feedback
- VS Code shows chord progress indicators
- Status bar provides context about active modes
- Icons and themes work seamlessly together

### 🔧 Customization
- Edit keybindings: `Space f k` → Opens keybindings editor
- Edit settings: `Space o m` → Opens settings.json
- All keybindings are in: `~/Library/Application Support/Code/User/keybindings.json`

### 📚 Learning Path
1. Start with most common: `Space f c`, `Space g b`, `Space r p`
2. Practice file operations: `Space o m`, `Space o n`
3. Master git workflow: `Space g g`, `Space g d`, `Space g b`
4. Advanced: Window navigation with `Ctrl+hjkl`

---

## 🛠️ Extensions Required

For optimal functionality, ensure these extensions are installed:
- **Vim** (vscodevim.vim) - Core vim functionality
- **GitLens** - Enhanced git blame and history
- **GitHub Copilot** - AI assistance and chat
- **ESLint** - JavaScript/TypeScript linting

---

## 📝 Notes

- **Leader key**: Space (matches your Neovim setup)
- **Chord sequences**: Press keys in sequence, don't hold
- **Context awareness**: Most keybindings only work when editor is focused
- **Vim compatibility**: All keybindings work seamlessly with Vim mode
- **Theme**: Bearded Theme Arc (matches your preference)
- **Icons**: VS Code Icons extension with working status bar icons

---

*Last updated: July 11, 2025*
*Configuration file: `~/Library/Application Support/Code/User/keybindings.json`*
