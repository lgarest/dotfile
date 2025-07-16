#!/bin/bash

# Script to activate Warp AI from within tmux
# This tries multiple methods to activate Warp AI

# Method 1: Try sending the escape sequence directly
osascript -e 'tell application "System Events" to keystroke "\\" using {control down}' 2>/dev/null || {
    # Method 2: Try using AppleScript to send the keystroke to Warp
    osascript -e 'tell application "Warp" to activate' 2>/dev/null
    sleep 0.1
    osascript -e 'tell application "System Events" to keystroke "\\" using {control down}' 2>/dev/null || {
        # Method 3: Fallback to typing the command
        echo -n "#warp-ai "
    }
}
