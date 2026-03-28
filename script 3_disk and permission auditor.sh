#!/bin/bash
# Script 3: Disk and Permission Auditor
# Displays size, owner, and permissions of important directories

DIRS=("/etc" "/var/log" "/home" "/usr/bin" "/tmp")

echo "======================================"
echo "      Directory Audit Report"
echo "======================================"

# --- Loop through directories ---
for DIR in "${DIRS[@]}"; do
    if [ -d "$DIR" ]; then

        # Get permissions, owner, group
        PERMS=$(ls -ld "$DIR" | awk '{print $1}')
        OWNER=$(ls -ld "$DIR" | awk '{print $3}')
        GROUP=$(ls -ld "$DIR" | awk '{print $4}')

        # Get size (suppress permission errors)
        SIZE=$(du -sh "$DIR" 2>/dev/null | cut -f1)

        # If size couldn't be calculated
        if [ -z "$SIZE" ]; then
            SIZE="Access Denied"
        fi

        # Print formatted output
        printf "%-12s | Perm: %-10s | Owner: %-8s | Group: %-8s | Size: %s\n" \
        "$DIR" "$PERMS" "$OWNER" "$GROUP" "$SIZE"

    else
        echo "$DIR does not exist"
    fi
done

echo "--------------------------------------"

# --- Extra: Check config directory ---
CONFIG_DIR="/etc"

if [ -d "$CONFIG_DIR" ]; then
    echo "Config directory ($CONFIG_DIR) exists."
    ls -ld "$CONFIG_DIR"
fi  echo "Config directory not found."
