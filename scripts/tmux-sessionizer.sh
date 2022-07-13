#!/usr/bin/env bash

# get the interesting directories in a fzf way
session=$(find ~ ~/dev ~/personal -type d -maxdepth 1 -mindepth 1 | fzf)

# get the desired session name
session_name=$(basename "$session" | tr . _)

# create a new tmux session if no session is available with the $session_name
if ! tmux has-session -t "$session_name"; then
  tmux new-session -s "$session_name" -c "$session" -d
fi

# jump into the session 
# Note: we are assuming that we are in tmux and running
tmux switch-client -t "$session_name"
