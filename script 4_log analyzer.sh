#!/bin/bash
# Script 4: Log File Analyzer
# Counts keyword occurrences in a log file

# --- Default values ---
LOGFILE=${1:-/var/log/dpkg.log}
KEYWORD=${2:-"error"}

COUNT=0

echo "Analyzing log file..."
echo "File: $LOGFILE"
echo "Keyword: $KEYWORD"
echo "--------------------------"

# --- Check file exists ---
if [ ! -f "$LOGFILE" ]; then
    echo "Error: File not found."
    echo "Available log files:"
    ls /var/log
    exit 1
fi

# --- Check file is not empty ---
if [ ! -s "$LOGFILE" ]; then
    echo "File is empty. Try another log file."
    exit 1
fi

# --- Count keyword occurrences ---
while IFS= read -r LINE; do
    if echo "$LINE" | grep -iq "$KEYWORD"; then
        COUNT=$((COUNT + 1))
    fi
done < "$LOGFILE"

# --- Output result ---
echo ""
echo "Total matches: $COUNT"
echo ""

# --- Show last 5 matches ---
MATCHES=$(grep -i "$KEYWORD" "$LOGFILE")

if [ -z "$MATCHES" ]; then
    echo "No matching lines found."
else
    echo "Last 5 matching lines:"
    echo "$MATCHES" | tail -5
fi
