#!/bin/bash
# Script 5: Open Source Manifesto Generator
# This script takes user input and generates a manifesto text file

echo "======================================"
echo " Open Source Manifesto Generator"
echo "======================================"
echo ""

# --- Take user input ---
read -p "1. Name one open-source tool you use daily: " TOOL
read -p "2. In one word, what does 'freedom' mean to you? " FREEDOM
read -p "3. What will you build and share? " BUILD

# --- Validate inputs (basic check) ---
if [ -z "$TOOL" ] || [ -z "$FREEDOM" ] || [ -z "$BUILD" ]; then
    echo "Error: All fields must be filled."
    exit 1
fi

# --- Variables ---
DATE=$(date '+%d %B %Y')
USER_NAME=$(whoami)
OUTPUT="manifesto_${USER_NAME}.txt"

# --- Write manifesto to file ---
{
echo "--------------------------------------"
echo " Open Source Manifesto"
echo "--------------------------------------"
echo "Author : $USER_NAME"
echo "Date   : $DATE"
echo ""
echo "I believe that open source represents $FREEDOM."
echo "Tools like $TOOL show how collaboration can build powerful systems."
echo "I aim to create $BUILD and share it freely with everyone."
echo ""
echo "This is my contribution to the open-source community."
echo "--------------------------------------"
} > "$OUTPUT"

# --- Display output ---
echo ""
echo "✅ Manifesto saved to file: $OUTPUT"
echo ""
cat "$OUTPUT"
