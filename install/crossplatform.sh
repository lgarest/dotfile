#! /usr/bin/env bash

NOTES_DIR="$HOME/dev/notes"
DOTFILE_DIR="$HOME/dev/dotfile"

check_prerequisites() {
  echo "Checking prerequisites..."
  check_command git
  echo "  -> git (installed)"
  echo "  -> passed"
}

install_notes() {
  if [[ ! -d "$NOTES_DIR" ]]; then
    check_command git
    mkdir -p "$NOTES_DIR"
    git clone https://github.com/lgarest/notes "$NOTES_DIR"
  else
    echo "Dotfile repo already present at $NOTES_DIR, skipping dir creation..."
  fi
}

install_scripts() {
  # todo: check if dotfile exists, clone if not
  if [[ ! -d ~/bin ]]; then
    mkdir -p ~/bin
  else
    echo "Bin directory already present at ~/bin, skipping dir creation..."
  fi
  ln --force --symbolic --verbose $DOTFILE_DIR/scripts/tmux-fzf-session.sh ~/bin/
  ln --force --symbolic --verbose $DOTFILE_DIR/scripts/tmux-sessionizer.sh ~/bin/
  ln --force --symbolic --verbose $DOTFILE_DIR/scripts/braindump.sh ~/bin/
}

install_shell_configs() {
  ln --force --symbolic --verbose $DOTFILE_DIR/shells/bash/bashrc ~/.bashrc
}

main() {
  echo "Installing notes and cross-platform scripts and shell configs..."
  check_prerequisites
  install_notes
  install_scripts
  install_shell_configs
}

# main
install_scripts
