#! /usr/bin/env bash

install_scripts() {
  # todo: check if dotfile exists, clone if not
  mkdir -p ~/bin
  ln --force --symbolic --verbose ~/dev/dotfile/scripts/tmux-fzf-session.sh ~/bin/
  ln --force --symbolic --verbose ~/dev/dotfile/scripts/tmux-sessionizer.sh ~/bin/
  ln --force --symbolic --verbose ~/dev/dotfile/scripts/braindump.sh ~/bin/
}

install_shell_configs() {
  ln --force --symbolic --verbose ~/dev/dotfile/shells/bash/bashrc ~/.bashrc
}

mkdirs() {
  mkdir -p ~/dev/dotfile
  mkdir -p ~/dev/notes
}

main() {
  mkdirs
  install_shell_configs
}
main
