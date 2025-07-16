# Fix Warp AI Interaction in tmux

## Problem
`Ctrl+\` for Warp AI activation was being intercepted by tmux instead of being passed through to Warp.

## Solution

### 1. Tmux Configuration (✅ Already Applied)
Added the following to your `tmux.conf`:

```bash
# Warp AI keybinding passthrough
# Allow Ctrl+\ to pass through to Warp for AI agent activation
bind-key -n C-\\ send-keys C-\\
```

### 2. Reload tmux configuration
Run this command to apply the changes:

```bash
tmux source-file ~/.tmux.conf
```

### 3. Alternative Methods to Activate Warp AI

If `Ctrl+\` still doesn't work, you have these alternatives:

#### Method 1: Type the command directly
```bash
#warp-ai your question here
```

#### Method 2: Use Warp's command palette
- Press `Cmd+Shift+P` (works from anywhere in Warp)
- Type "AI" and select the AI command

#### Method 3: Use Warp's AI menu
- Right-click in the terminal
- Select "Ask Warp AI" from the context menu

### 4. Testing the Fix

1. **Start the agentic development session:**
   ```bash
   agentic
   ```

2. **Try each method in the AI Agent pane (bottom-right):**
   - `Ctrl+\` - should now work
   - `#warp-ai test question` - should work
   - `Cmd+Shift+P` - should work

### 5. Troubleshooting

If `Ctrl+\` still doesn't work:

1. **Check tmux key bindings:**
   ```bash
   tmux list-keys | grep C-\\\\
   ```

2. **Alternative tmux binding (if needed):**
   Add this to your `tmux.conf`:
   ```bash
   # Alternative: bind to a different key
   bind-key -n C-y send-keys C-\\
   ```

3. **Warp Terminal Settings:**
   - Go to Warp Settings → Features → AI
   - Check if the AI keybinding is properly configured

### 6. Best Practices for Agentic Development

1. **Use the dedicated AI pane** (bottom-right) for AI interactions
2. **Keep context clear** by describing what you're working on
3. **Use specific panes** for different purposes:
   - Left: Editor (nvim)
   - Top-right: Commands and builds
   - Bottom-right: AI interactions

### 7. Quick Reference

| Action | Method |
|--------|--------|
| Activate AI | `Ctrl+\` or `#warp-ai` or `Cmd+Shift+P` |
| Navigate panes | `Ctrl+h/j/k/l` |
| Switch windows | `Ctrl+Space + h/l` |
| Reload tmux config | `Ctrl+Space + i` |

## Verification

After applying these changes, you should be able to:
- Use `Ctrl+\` to activate Warp AI from within tmux
- Navigate seamlessly between editor and terminal
- Have a dedicated AI assistance pane for development

If you continue to have issues, the fallback methods (`#warp-ai` and `Cmd+Shift+P`) will always work.
