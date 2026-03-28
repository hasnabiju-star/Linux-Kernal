#!/bin/bash
# Script 2: FOSS Package Inspector
# Checks if a package is installed and shows details

PACKAGE="bash"   # Change this if needed

echo "Checking package: $PACKAGE"
echo "--------------------------"

# --- Check if package is installed ---
if dpkg -s "$PACKAGE" &>/dev/null; then
    echo "$PACKAGE is installed."

    # Show version, status, description
    dpkg -s "$PACKAGE" | grep -E 'Version|Status|Description'
else
    echo "$PACKAGE is NOT installed."
fi

# --- Case statement for description ---
case $PACKAGE in
    bash) echo "Bash: the default Linux shell used in terminals" ;;
    apache2) echo "Apache: web server powering websites" ;;
    mysql-server) echo "MySQL: database system for applications" ;;
    firefox) echo "Firefox: open-source web browser" ;;
    *) echo "General open-source package" ;;
esac
