#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Weather in
# @raycast.mode fullOutput

# Optional parameters:
# @raycast.icon 🌤️
# @raycast.argument1 { "type": "text", "placeholder": "barcelona" }

# Documentation:
# @raycast.description Weather in
curl -s "wttr.in/$1?n" && curl -s "v2.wttr.in/$1"
# __@raycast.argument1 { "type": "dropdown", "placeholder": "location", "data": [{"title": "Barcelona", "value": "barcelona"},{"title": "Tolleric", "value": "Tolleric"},{"title": "Current", "value": "Barcelona"}] }
