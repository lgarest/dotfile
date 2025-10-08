#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Current weather
# @raycast.mode inline
# @raycast.refreshTime 1h

# Optional parameters:
# @raycast.icon 🌦️

# Documentation:
# @raycast.description Current weather

# curl -s "wttr.in/Tolleric?format=3"
curl -s "wttr.in/Barcelona?format=3"
