#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Neovim Startup Time
# @raycast.mode fullOutput

# Optional parameters:
# @raycast.icon 🚀
# @raycast.packageName Developer Tools

# Documentation:
# @raycast.description Display Neovim startup time analysis
# @raycast.author Luis Garcia
# @raycast.authorURL https://github.com/lgarciae

# Create a temporary file for the startup log
STARTUP_LOG=$(mktemp)

# Run nvim with startuptime flag
nvim --startuptime "$STARTUP_LOG" +qall

# Display the startup time analysis
echo "📊 Neovim Startup Time Analysis"
echo "================================"
echo ""

# Show total startup time
TOTAL_TIME=$(tail -n 1 "$STARTUP_LOG" | awk '{print $1}')
echo "⏱️  Total startup time: ${TOTAL_TIME}ms"
echo ""

# Show top 10 slowest operations
echo "🐌 Top 10 slowest operations:"
echo "-----------------------------"
grep -E "^[0-9]+\.[0-9]+\s+[0-9]+\.[0-9]+:" "$STARTUP_LOG" | \
    sort -k2 -nr | \
    head -10 | \
    awk '{printf "%6.2fms  %s\n", $2, substr($0, index($0,$3))}'

echo ""
echo "📝 Full startup log saved to: $STARTUP_LOG"

# Optionally show the full log
echo ""
echo "Full startup log:"
echo "-----------------"
cat "$STARTUP_LOG"

# Clean up
rm -f "$STARTUP_LOG"
