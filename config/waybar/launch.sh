if pgrep -x "waybar" > /dev/null; then
  killall waybar
  pkill waybar
else
  waybar
fi

