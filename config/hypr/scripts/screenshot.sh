#!/bin/bash

DIR="$HOME/Pictures/screenshots/"
NAME="screenshot_$(date +%d%m%Y_%H%M%S).jpg"

option2="Selected area"
option3="Fullscreen (delay 2 sec)"
option4="Current display (delay 2 sec)"

options="$option2\n$option3\n$option4"
current_hyprshade=""
choice=$(echo -e "$options" | rofi -dmenu -replace -config ~/.config/rofi/config-screenshot.rasi -i -no-show-icons -l 3 -width 30 -p "Take Screenshot")
if [ ! -z $(hyprshade current) ] ;then
    current_hyprshade=$(hyprshade current)
    echo ":: Switch hyprshade off"
    hyprshade off
fi

case $choice in
    $option2)
        grim -g "$(slurp)" "$DIR$NAME"
        echo $current_hyprshade
        if [ ! -z $current_hyprshade ] ;then
            hyprshade on $current_hyprshade
        fi
        xclip -selection clipboard -t image/jpeg -i "$DIR$NAME"
        notify-send "Screenshot created and copied to clipboard" "Mode: Selected area" -i "$DIR$NAME"
        swappy -f "$DIR$NAME"
    ;;
    $option3)
        sleep 2
        grim "$DIR$NAME"
        if [ ! -z $current_hyprshade ] ;then
            hyprshade on $current_hyprshade
        fi
        xclip -selection clipboard -t image/jpeg -i "$DIR$NAME"
        notify-send "Screenshot created and copied to clipboard" "Mode: Fullscreen" -i "$DIR$NAME"
        swappy -f "$DIR$NAME"
    ;;
    $option4)
        sleep 2
        monitor="$(hyprctl monitors | awk '/Monitor/{monitor=$2} /focused: yes/{print monitor; exit}')"
        grim -o "$monitor" "$DIR$NAME"
        if [ ! -z $current_hyprshade ] ;then
            hyprshade on $current_hyprshade
        fi
        xclip -selection clipboard -t image/jpeg -i "$DIR$NAME"
        notify-send "Screenshot created and copied to clipboard" "Mode: Fullscreen" -i "$DIR$NAME"
        swappy -f "$DIR$NAME"
    ;;
esac
