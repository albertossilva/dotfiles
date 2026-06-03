#!/bin/bash

DIR="$HOME/Pictures/screenshots"
NAME="screenshot_$(date +%d%m%Y_%H%M%S).jpg"
FILENAME="$DIR/$NAME"

SLEEP=5
option1="Selected area"
option2="Selected area (delay $SLEEP sec)"
option3="Current display (delay $SLEEP sec)"
option4="Fullscreen (delay $SLEEP sec)"

options="$option1\n$option2\n$option3\n$option4"
current_hyprshade=""

IFS='\n' read -ra linesSplit <<< "$options"
lines=${#linesSplit[@]}
lines=$((lines / 2))

choice=$(echo -e "$options" | rofi -dmenu -replace -config ~/.config/rofi/config-screenshot.rasi -i -no-show-icons -l $lines -width 30 -p "Take Screenshot")

if [ ! -z $(hyprshade current) ] ;then
    current_hyprshade=$(hyprshade current)
    echo ":: Switch hyprshade off"
    hyprshade off
fi

slurp=""
if [[ "$choice" == *Selected* ]]; then
  slurp=$(slurp)
fi

if [[ "$choice" == *delay* ]]; then
  sleep $SLEEP
fi

case $choice in
  $option1|$option2)
    grim -g "$slurp" "$FILENAME"
  ;;
  $option3)
    monitor="$(hyprctl monitors | awk '/Monitor/{monitor=$2} /focused: yes/{print monitor; exit}')"
    grim -o "$monitor" "$FILENAME"
  ;;
  $option4)
    grim "$FILENAME"
  ;;
esac

if [[ "$choice" != "" ]]; then
  if [ ! -z $current_hyprshade ] ;then
    hyprshade on $current_hyprshade
  fi
  xclip -selection clipboard -t image/jpeg -i "$FILENAME"
  notify-send "Screenshot created and copied to clipboard" "$choice" -i "$FILENAME"
  swappy -f "$FILENAME"
fi


