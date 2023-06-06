#!/bin/bash

# Define your path example log
SYSLOG="/var/log/syslog"

# Backup your example into the new one
LOG_LOCATION="/var/log/challenge.log"

# Folder name
FOLDER="linux-challenge"

# Export final result to new file
EXPORT_LOCATION="$HOME/linux-challenge/new.log"

# Specify Date
DATE="$(date '+%d-%m-%Y')"

# Interactive prompt user for input
read -p "Enter date of syslog search [format: dd-mm-yyy] or (leave blank for today's date): " DATE_TEXT

# If there is no date text provided, use today's date
if [[ -z "$DATE_TEXT" ]]; then
    DATE_TEXT="$DATE"
fi

# Create challenge.log file if it doesn't exist
if [[ ! -f "$LOG_LOCATION" ]]; then
    touch "$LOG_LOCATION"
fi

# Create folder
if [ ! -d "$FOLDER" ]; then
  mkdir -p "$FOLDER"
  echo "Folder created: $FOLDER"
else
  echo "Folder already exists: $FOLDER"
fi

# Append syslog into challenge.log
cat "$SYSLOG" > "$LOG_LOCATION"

# Search for date and text then replace "Error or error" with "Not Error" also export into new final result file
grep "$DATE_TEXT" "$LOG_LOCATION" | grep "Error\|error" | sed "s/.*rror/Not Error/g" > "$EXPORT_LOCATION"

# Print some text below
echo -e "\n\e[1mSummary Report:\e[0m"
echo -e "\e[1m----------------\e[0m"

# Show latestfinal result file with color output
while read line; do
  # Check if the line contains "Not Error" and change color to green, otherwise color to orange
  if [[ $line == *"Not Error"* ]]; then
    echo -e "\e[32m$line\e[0m"
  else
    echo -e "\e[33m$line\e[0m"
  fi
done < "$EXPORT_LOCATION" | tail
