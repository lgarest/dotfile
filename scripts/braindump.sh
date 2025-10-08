#/usr/bin/env bash

now=$(date +"%Y-%m-%d %H:%M:%S")
current_month=$(date +"%Y-%m")
file=~/personal/notes/dumps/$current_month-braindump.txt

echo "Writing into $file ..."
echo "[$now] $@" >> $file
tail -n 5 $file | $(which bat)
