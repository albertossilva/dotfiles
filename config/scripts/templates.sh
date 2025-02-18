#!/bin/bash

# Select text file
selected=$(ls -1 ~/private/templates | rofi -dmenu -p "Select the template")

if [ "$selected" ]; then
    # Add content to clipboard
    xclip -sel clip ~/private/templates/$selected
fi
