#! /usr/bin/env bash

set -euo pipefail

DOTFILE_DIR="$HOME/dev/dotfile"

echo "==> Omarchy setup starting..."

echo "==> [1/4] Cross-platform symlinks and shell configs"
bash "$DOTFILE_DIR/install/crossplatform.sh"

echo "==> [2/4] Hyprland overrides"
bash "$DOTFILE_DIR/omarchy/install-overrides.sh"

echo "==> [3/4] Tmux overrides"
bash "$DOTFILE_DIR/tmux/install-overrides.sh"

echo "==> [4/4] AUR packages"
bash "$DOTFILE_DIR/packages/yay.sh"

echo "==> Omarchy setup complete"
