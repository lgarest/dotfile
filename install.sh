#! /usr/bin/env bash

set -euo pipefail

DOTFILE_DIR="$HOME/dev/dotfile"

check_prerequisites() {
  echo "Prerequisites..."
  if ! command -v git >/dev/null 2>&1; then
    echo "  -> git (not installed)"
    echo "sudo apt install git | yay -S git | brew install git"
    exit 1
  fi
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

main() {
  check_prerequisites

  if [[ ! -d "$DOTFILE_DIR" ]]; then
    mkdir -p "$DOTFILE_DIR"
    git clone https://github.com/lgarest/dotfile "$DOTFILE_DIR"
  else
    echo "Dotfile repo already present at $DOTFILE_DIR, skipping clone..."
  fi

  local platform
  platform=$(detect_platform)
  echo "Platform detected: $platform"

  case "$platform" in
    omarchy)
      bash "$DOTFILE_DIR/install/omarchy.sh"
      ;;
    macos)
      bash "$DOTFILE_DIR/install/macos.sh"
      ;;
    *)
      echo "No platform-specific setup available. Run the appropriate script from $DOTFILE_DIR/install/ manually."
      ;;
  esac

  echo "Installation -> complete"
}

main
