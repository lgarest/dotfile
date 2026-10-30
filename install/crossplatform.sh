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
  ln -fsv $DOTFILE_DIR/scripts/tmux-fzf-session.sh ~/bin/
  ln -fsv $DOTFILE_DIR/scripts/tmux-sessionizer.sh ~/bin/
  ln -fsv $DOTFILE_DIR/scripts/braindump.sh ~/bin/
}

install_shell_configs() {
  ln -fsv $DOTFILE_DIR/shells/bash/bashrc ~/.bashrc
  ln -fsv $DOTFILE_DIR/shells/zsh/.zshrc ~/.zshrc
}

install_cross_tools() {

  if ! command -v mise >/dev/null 2>&1; then
    curl -fsSL https://mise.run | sh
    echo 'eval "$(~/.local/bin/mise activate zsh)"' >>~/.zshrc
    mise completion bash --install
  else
    echo "mise already exists"
    echo "  -> git (already installed)"
  fi

  if ! command -v claude >/dev/null 2>&1; then
    curl -fsSL https://claude.ai/install.sh | bash
  else
    echo "  -> claude (already installed)"
  fi

}

main() {
  echo "Installing notes and cross-platform scripts and shell configs..."
  check_prerequisites
  install_notes
  install_scripts
  install_shell_configs
  install_cross_tools
}

# main
#install_scripts
install_cross_tools
