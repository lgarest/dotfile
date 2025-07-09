#!/usr/bin/env bash

current=`tmux display-message -p '#S'`
# get active sessions, fzf them and get only the name
sessions=$(tmux list-session -F "#{session_name}" | grep -v "$current")

if [ $(echo "$sessions" | wc -l) -eq 1 ]; then
  session=$sessions
else
  session=$(echo "$sessions" | fzf --style=full --tmux=center)
fi

# switch to the selection
tmux switch-client -t "$session"
