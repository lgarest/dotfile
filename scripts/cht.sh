#!/usr/bin/env bash

languages=$(echo "typescript react ruby javascript vim css node" | tr " " "\n")
core_utils=$(echo "git find xargs sed awk tr cut grep curl bc cat read echo ln head tail less gpg" | tr " " "\n")

selected=$(echo -e "$languages\n$core_utils" | fzf)

read -p "What is your query for $selected? " query

if echo "$languages" | grep -qs $selected; then
  curl cht.sh/$selected/$(echo "$query" | tr " " "+") | less
else 
  curl cht.sh/$selected~$query | less
fi


# new pane
