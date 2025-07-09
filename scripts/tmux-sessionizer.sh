#!/usr/bin/env bash

# directories to search in
search_dirs=("$HOME/.config" "$HOME/bin")
search_dirs+=("$HOME/dev")
search_dirs+=("$HOME/personal")

# get the directories using fzf way
session=$(find "${search_dirs[@]}" -type d -maxdepth 1 -mindepth 1 \
  | sort \
  | uniq \
  | fzf --style=full --tmux=center)

# get the desired session name
session_name=$(basename "$session" | tr . _)

# create a new tmux session if no session is available with the $session_name
if ! tmux has-session -t "$session_name"; then
  tmux new-session -s "$session_name" -c "$session" -d
fi

tmux switch-client -t "$session_name"
