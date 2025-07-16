# Agentic Development with Warp AI + tmux

## Quick Start

```bash
# Start agentic development session
agentic [optional-project-path]

# Or manually
~/personal/dotfile/scripts/tmux-agentic-dev.sh /path/to/project
```

## Session Layout

```
┌─────────────────────────┬─────────────────────────┐
│                         │      Command Terminal   │
│                         │                         │
│        Editor           │  • Run tests           │
│        (nvim)           │  • Build commands      │
│                         │  • File operations     │
│                         ├─────────────────────────┤
│                         │      AI Agent Pane     │
│                         │                         │
│                         │  🤖 Warp AI Assistant  │
│                         │  • Code analysis       │
│                         │  • Generate solutions   │
│                         │  • Debug assistance     │
└─────────────────────────┴─────────────────────────┘
```

## Navigation

Using your configured tmux navigation:

- **Ctrl+h/j/k/l**: Navigate between panes (works with nvim splits too!)
- **Ctrl+Space + h/l**: Switch between windows
- **Ctrl+Space + numbers**: Jump to specific windows

## Agentic Development Workflow

### 1. Code Analysis
In the AI Agent pane:
```
#warp-ai analyze this codebase structure
```

### 2. Problem Solving
```
#warp-ai I'm getting this error: [paste error]
#warp-ai help me debug this function in editor pane
```

### 3. Code Generation
```
#warp-ai generate a test for the function in my editor
#warp-ai create a TypeScript interface for this data structure
```

### 4. Documentation
```
#warp-ai generate documentation for this API
#warp-ai explain this complex function
```

### 5. Refactoring
```
#warp-ai suggest improvements for this code
#warp-ai help me refactor this to be more performant
```

## Window Usage

### Window 0: Main Development
- **Pane 0**: Editor (nvim)
- **Pane 1**: Command terminal
- **Pane 2**: AI Agent interaction

### Window 1: Git Operations
- Monitor git status
- Handle commits and pushes
- View git logs

### Window 2: Testing
- Run test suites
- Monitor test results
- Debug failing tests

## Advanced Tips

### 1. Copy Between Panes
- Use tmux copy mode: `Ctrl+Space [` 
- Or use Warp's native copy functionality

### 2. Sync Panes (when needed)
```bash
# Sync input to all panes in window
tmux setw synchronize-panes on
```

### 3. Save Session State
Your tmux session persists even if you close Warp, so you can:
```bash
# Detach from session
tmux detach

# Reattach later
tmux attach -t agentic-dev
```

### 4. AI Agent Best Practices

#### Context Setting
```
#warp-ai I'm working on a [TypeScript/Python/etc] project
#warp-ai The current file is [filename] and it does [purpose]
```

#### Code Reviews
```
#warp-ai review the changes I made in this git diff
#warp-ai suggest security improvements for this code
```

#### Architecture Questions
```
#warp-ai what's the best pattern for this use case?
#warp-ai help me design the database schema for this feature
```

## Customization

### Add Custom Windows
Edit `~/personal/dotfile/scripts/tmux-agentic-dev.sh`:

```bash
# Add a database window
tmux new-window -t $SESSION_NAME -n 'db' -c $PROJECT_PATH
tmux send-keys -t $SESSION_NAME:3 'mongosh' C-m
```

### Change Layout
Modify the pane creation and sizing in the script:

```bash
# Different layout: vertical split instead of horizontal
tmux split-window -v -t $SESSION_NAME:0 -c $PROJECT_PATH
```

## Integration with Existing Workflow

This setup works seamlessly with your existing:
- **vim-tmux-navigator**: Navigate between editor and terminal
- **Git workflows**: Use existing git aliases and functions
- **FZF integration**: Search files, branches, etc.
- **Fish shell**: All your aliases and functions work

## Troubleshooting

### AI Agent Not Responding
- Make sure you're using `#warp-ai` or `Ctrl+\`` to activate
- Check Warp AI settings in preferences

### Navigation Issues
- Ensure tmux session is active: `tmux ls`
- Check if vim-tmux-navigator is working: `Ctrl+h` should work

### Session Management
```bash
# List all sessions
tmux ls

# Kill specific session
tmux kill-session -t agentic-dev

# Kill all sessions
tmux kill-server
```

## Keyboard Shortcuts Reference

| Action | Shortcut |
|--------|----------|
| Navigate panes | `Ctrl+h/j/k/l` |
| Switch windows | `Ctrl+Space + h/l` |
| Create new window | `Ctrl+Space + c` |
| Activate AI Agent | `Ctrl+\`` or `#warp-ai` |
| Copy mode | `Ctrl+Space + [` |
| Paste | `Ctrl+Space + ]` |
| Detach session | `Ctrl+Space + d` |
| Reload tmux config | `Ctrl+Space + i` |
