#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Weather in
# @raycast.mode fullOutput

# Optional parameters:
# @raycast.icon 🌤️
# @raycast.argument1 { "type": "dropdown", "placeholder": "location", "data": [{"title": "Barcelona", "value": "barcelona"},{"title": "Tolleric", "value": "Tolleric"},{"title": "Current", "value": "Barcelona"}] }

# Documentation:
# @raycast.description Weather in
curl "wttr.in/$1?n" && curl "v2.wttr.in/$1"
