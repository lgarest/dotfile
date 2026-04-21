#/usr/bin/env bash

now=$(date +"%Y-%m-%d %H:%M:%S")
current_month=$(date +"%Y-%m")
file=~/dev/notes/dumps/$current_month-braindump.txt

if [[ ! -e $file ]]; then
  echo "Creating new braindump file for $current_month"
  touch $file
fi

echo "Writing into $file ..."
echo "[$now] $@" >>$file
tail -n 5 $file | $(which bat)
