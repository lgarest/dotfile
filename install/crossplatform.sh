#! /usr/bin/env bash

add_symlinks() {
  ln --force --symbolic --verbose ~/dev/dotfile/scripts/tmux-fzf-session.sh ~/bin/
  ln --force --symbolic --verbose ~/dev/dotfile/scripts/tmux-sessionizer.sh ~/bin/
  ln --force --symbolic --verbose ~/dev/dotfile/scripts/braindump.sh ~/bin/
}

add_symlinks
