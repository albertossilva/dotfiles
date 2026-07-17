#!/bin/bash

DIR="$HOME/Pictures/screenshots/"
NAME="screenshot_$(date +%d%m%Y_%H%M%S).png"

option1="Selected window (delay 3 sec)"
option2="Selected area"
option3="Fullscreen (delay 3 sec)"

options="$option2\n$option3\n$option1"

choice=$(echo -e "$options" | rofi -i -dmenu -replace -config ~/.config/rofi/config-screenshot.rasi -width 30 -l 3 -p "Take Screenshot")

case $choice in
    $option1)
        scrot $DIR$NAME -d 3 -e 'xclip -selection clipboard -t image/png -i $f' -c -z -u
        notify-send "Screenshot created" "Mode: Selected window"
    ;;
    $option2)
        scrot $DIR$NAME -s -e 'xclip -selection clipboard -t image/png -i $f'
        notify-send "Screenshot created" "Mode: Selected area"
    ;;
    $option3)
        scrot $DIR$NAME -d 3 -e 'xclip -selection clipboard -t image/png -i $f'
        notify-send "Screenshot created" "Mode: Fullscreen"
    ;;
esac
