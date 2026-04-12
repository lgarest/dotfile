#/usr/bin/env bash

set -e

TMUX_CONFIG="$HOME/.config/tmux/tmux.conf"
# change to the script's directory and get the absolute path
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
OVERRIDES_CONFIG="$SCRIPT_DIR/tmux-overrides.conf"
SOURCE_LINE="source-file $OVERRIDES_CONFIG"

require_file() {
  if [ ! -f "$1" ]; then
    echo "$2 not found at $1."
    exit 1
  fi
}

require_file "$TMUX_CONFIG" "Tmux config"
require_file "$OVERRIDES_CONFIG" "Overrides config"

# Check if source line exists in tmux.conf
if grep -Fxq "$SOURCE_LINE" "$TMUX_CONFIG"; then
  echo "Overrides already sourced in $TMUX_CONFIG"
else
  echo "Adding source line to Tmux config..."
  echo "" >>"$TMUX_CONFIG"
  echo "# Source Tmux overrides" >>"$TMUX_CONFIG"
  echo "$SOURCE_LINE" >>"$TMUX_CONFIG"
  echo "Source line added successfully."
fi

echo "Tmux overrides complete"
