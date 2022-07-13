#!/usr/bin/env bash

# get active sessions, fzf them and get only the name
session=$(tmux list-session -F "#{session_name}" | fzf)

# switch to the selection
tmux switch-client -t "$session"
