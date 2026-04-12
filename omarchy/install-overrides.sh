#/usr/bin/env bash

set -e

HYPRLAND_CONFIG="$HOME/.config/hypr/hyprland.conf"
# change to the script's directory and get the absolute path
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
OVERRIDES_CONFIG="$SCRIPT_DIR/omarchy-overrides.conf"
SOURCE_LINE="source = $OVERRIDES_CONFIG"

require_file() {
  if [ ! -f "$1" ]; then
    echo "$2 not found at $1."
    exit 1
  fi
}

require_file "$HYPRLAND_CONFIG" "Hyprland config"
require_file "$OVERRIDES_CONFIG" "Overrides config"

# Check if source line exists in hyprland.config
if grep -Fxq "$SOURCE_LINE" "$HYPRLAND_CONFIG"; then
  echo "Overrides already sourced in $HYPRLAND_CONFIG"
else
  echo "Adding source line to Hyprland config..."
  echo "" >> "$HYPRLAND_CONFIG"
  echo "# Source Omarchy overrides" >> "$HYPRLAND_CONFIG"
  echo "$SOURCE_LINE" >> "$HYPRLAND_CONFIG"
  echo "Source line added successfully."
fi

echo "Hyprland overrides complete"
