#!/bin/bash

# Tmux agentic development setup
# Works within existing session or creates new one

PROJECT_PATH=${1:-$(pwd)}

# Function to setup agentic layout in current session
setup_agentic_layout() {
    local window_name="agentic-dev"
    
    # Create new window for agentic development
    tmux new-window -n "$window_name" -c "$PROJECT_PATH"
    
    # Split horizontally - left for editor, right for terminal
    tmux split-window -h -c "$PROJECT_PATH"
    
    # Split the right pane vertically - top for commands, bottom for agent
    tmux split-window -v -c "$PROJECT_PATH"
    
    # Pane layout:
    # ┌─────────────┬─────────────┐
    # │             │   Command   │
    # │   Editor    │   Terminal  │
    # │             ├─────────────┤
    # │             │  AI Agent   │
    # └─────────────┴─────────────┘
    
    # Configure pane sizes (60% for editor, 40% for right side)
    tmux resize-pane -t 1 -x 60%
    tmux resize-pane -t 2 -y 60%
    
    # Select editor pane
    tmux select-pane -t 1
    
    # Send commands to specific panes
    tmux send-keys -t 1 'nvim' C-m
    tmux send-keys -t 3 'echo "🤖 Warp AI Agent pane"' C-m
    tmux send-keys -t 3 'echo "💡 Ways to activate Warp AI:"' C-m
    tmux send-keys -t 3 'echo "  • Press: Alt+a (Warp command palette)"' C-m
    tmux send-keys -t 3 'echo "  • Press: Ctrl+Space then a"' C-m
    tmux send-keys -t 3 'echo "  • Press: Alt+w (try Ctrl+\\)"' C-m
    tmux send-keys -t 3 'echo "  • Direct: Cmd+Shift+P (universal)"' C-m
    tmux send-keys -t 3 'echo "  ⚠️ Note: #warp-ai does NOT work in tmux"' C-m
    
    echo "✅ Agentic development layout created in window: $window_name"
    echo "💡 Use Ctrl+h/j/k/l to navigate between panes"
    echo "🤖 AI activation: Alt+a (opens Warp palette), Cmd+Shift+P (universal)"
}

# Check if we're in a tmux session
if [ -n "$TMUX" ]; then
    echo "📱 Setting up agentic layout in current tmux session..."
    setup_agentic_layout
else
    echo "🚀 Creating new tmux session for agentic development..."
    
    SESSION_NAME="agentic-dev"
    
    # Kill existing session if it exists
    tmux kill-session -t $SESSION_NAME 2>/dev/null
    
    # Create new session
    tmux new-session -d -s $SESSION_NAME -c "$PROJECT_PATH"
    
    # Switch to the new session context for setup
    tmux rename-window -t $SESSION_NAME:1 'main'
    
    # Split horizontally - left for editor, right for terminal
    tmux split-window -h -t $SESSION_NAME:1 -c "$PROJECT_PATH"
    
    # Split the right pane vertically - top for commands, bottom for agent
    tmux split-window -v -t $SESSION_NAME:1.2 -c "$PROJECT_PATH"
    
    # Configure pane sizes (60% for editor, 40% for right side)
    tmux resize-pane -t $SESSION_NAME:1.1 -x 60%
    tmux resize-pane -t $SESSION_NAME:1.2 -y 60%
    
    # Window 2: Git and monitoring
    tmux new-window -t $SESSION_NAME -n 'git' -c "$PROJECT_PATH"
    
    # Window 3: Testing
    tmux new-window -t $SESSION_NAME -n 'test' -c "$PROJECT_PATH"
    
    # Select main window and editor pane
    tmux select-window -t $SESSION_NAME:1
    tmux select-pane -t $SESSION_NAME:1.1
    
    # Send commands to specific panes
    tmux send-keys -t $SESSION_NAME:1.1 'nvim' C-m
    tmux send-keys -t $SESSION_NAME:1.3 'echo "🤖 Warp AI Agent pane - Use Ctrl+\` or #warp-ai to interact"' C-m
    
    # Git window setup
    tmux send-keys -t $SESSION_NAME:2 'git status' C-m
    
    # Test window setup  
    tmux send-keys -t $SESSION_NAME:3 'echo "🧪 Test runner ready"' C-m
    
    # Attach to session
    tmux attach-session -t $SESSION_NAME
fi
