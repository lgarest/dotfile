#! /usr/bin/env bash

set -euo pipefail

# Check prerequisites
check_prerequisites() {
  echo "Prerequisites..."

  # Check if git is installed
  if [[ ! $(which git) ]]; then
    echo "  -> git (not installed)"
    echo "sudo apt install git | yay -S git | brew install git"
    exit 1
  else
    echo "  -> git (installed)"

  fi
  echo "  -> passed"
}

# Main installation function
main() {
  check_prerequisites
  if [[ ! -d "$HOME/dev/dotfile" ]]; then
    mkdir -p ~/dev/dotfile
    git clone https://github.com/lgarest/dotfile ~/dev/dotfile
  else
    echo "Skipping dotfiles installation..."
  fi
  echo "Installation -> complete"
}

# Run main installation
main
