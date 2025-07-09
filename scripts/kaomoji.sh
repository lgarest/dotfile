#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Kaomoji
# @raycast.mode compact

# Optional parameters:
# @raycast.icon 🤓
# @raycast.argument1 { "type": "text", "placeholder": "Placeholder" }

# Documentation:
# @raycast.description Generate a kaomoji
response=$(curl -X POST \
        -s \
        -H "Content-Type: application/json" \
        -d "{\"prompt\": \"$1\"}" \
        https://kaomoji-backend.vercel.app/api/generate-kaomoji.js | jq ".kaomoji" | tr -d '"')
echo "Copied $response to the clipboard! (＾▽＾)"
echo "$response" | pbcopy
