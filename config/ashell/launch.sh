if pgrep -x "ashell" > /dev/null; then
  killall ashell
  pkill ashell
else
  ashell
fi

