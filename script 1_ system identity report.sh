#!/bin/bash
# Script 1: System Identity Report
# This script displays basic information about the system

# --- Student details ---
STUDENT_NAME="Hasna"
SOFTWARE_CHOICE="Linux Kernel"

# --- Fetch system information ---
KERNEL=$(uname -r)        # Gets kernel version
USER_NAME=$(whoami)       # Gets current logged-in user
UPTIME=$(uptime -p)       # Shows system uptime
DATE=$(date)              # Current date and time
DISTRO=$(lsb_release -d | cut -f2)   # Linux distribution name

# --- Display output ---
echo "================================"
echo " Open Source Audit — $STUDENT_NAME"
echo "================================"
echo "Software: $SOFTWARE_CHOICE"
echo "Kernel  : $KERNEL"
echo "User    : $USER_NAME"
echo "Uptime  : $UPTIME"
echo "Date    : $DATE"
echo "Distro  : $DISTRO"

# Linux kernel is licensed under GPL v2
echo "License : GPL v2 (Freedom to use, modify and share)"
