#! /usr/bin/env bash

set -euo pipefail

DOTFILE_DIR="$HOME/dev/dotfile"

check_command() {
  if ! command -v $1 >/dev/null 2>&1; then
    echo "  -> $1 (not installed)"
    echo "Install it first sudo apt install $1 | yay -S $1 | brew install $1"
    exit 1
  fi
}

check_prerequisites() {
  echo "Checking prerequisites..."
  check_command git
  echo "  -> git (installed)"
  echo "  -> passed"
}

detect_platform() {
  if command -v Hyprland >/dev/null 2>&1 || [ -f "$HOME/.config/hypr/hyprland.conf" ]; then
    echo "omarchy"
  elif [[ "$(uname)" == "Darwin" ]]; then
    echo "macos"
  else
    echo "unknown"
  fi
}

install_dotfiles() {
  if [[ ! -d "$DOTFILE_DIR" ]]; then
    mkdir -p "$DOTFILE_DIR"
    git clone https://github.com/lgarest/dotfile "$DOTFILE_DIR"
  else
    echo "Dotfile repo already present at $DOTFILE_DIR, skipping clone..."
  fi
}

install_platform() {
  echo "Detecting platform..."
  local platform
  platform=$(detect_platform)
  echo "    -> platform detected: $platform"

  case "$platform" in
  omarchy)
    echo "    -> running omarchy setup..."
    bash "$DOTFILE_DIR/install/omarchy.sh"
    ;;
  macos)
    echo "    -> running macos setup..."
    bash "$DOTFILE_DIR/install/macos.sh"
    ;;
  *)
    echo "No platform-specific setup available. Run the appropriate script from $DOTFILE_DIR/install/ manually."
    ;;
  esac
}

main() {
  check_prerequisites
  install_dotfiles
  bash "$DOTFILE_DIR/install/crossplatform.sh"
  install_platform
  echo "Installation -> complete"
}

echo "$(detect_platform)"

# main
