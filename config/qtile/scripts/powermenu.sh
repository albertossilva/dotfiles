#!/bin/bash
echo $XDG_SESSION_TYPE
lockapp=slock
echo "Using $lockapp to lock the screen."

option1="  lock"
option2="  logout"
option3="  reboot"
option4="  power off"

options="$option1\n"
options="$options$option2\n"
options="$options$option3\n$option4"

choice=$(echo -e "$options" | rofi -dmenu -replace -config ~/.config/rofi/config-power.rasi -i -no-show-icons -l 4 -width 30 -p "Powermenu") 

case $choice in
	$option1)
		$lockapp ;;
	$option2)
		qtile cmd-obj -o cmd -f shutdown ;;
	$option3)
		systemctl reboot ;;
	$option4)
		systemctl poweroff ;;
esac

