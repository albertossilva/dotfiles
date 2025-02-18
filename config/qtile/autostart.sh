#!/bin/bash

# My screen resolution
# xrandr --rate 120

# For Virtual Machine 
# xrandr --output Virtual-1 --mode 1920x1080

# Keyboard layout
setxkbmap us

# Load picom
# picom &

# Load power manager
xfce4-power-manager &

# Load notification service
dunst &

# Setup Wallpaper and update colors
~/.config/qtile/scripts/wallpaper.sh init
