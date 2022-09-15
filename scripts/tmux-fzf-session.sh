#!/usr/bin/env bash

current=`tmux display-message -p '#S'`
# get active sessions, fzf them and get only the name
session=$(tmux list-session -F "#{session_name}" | grep -v "$current" | fzf)

# switch to the selection
tmux switch-client -t "$session"
