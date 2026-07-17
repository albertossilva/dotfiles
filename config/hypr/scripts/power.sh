#!/bin/bash
#  ____                        
# |  _ \ _____      _____ _ __ 
# | |_) / _ \ \ /\ / / _ \ '__|
# |  __/ (_) \ V  V /  __/ |   
# |_|   \___/ \_/\_/ \___|_|   
#                              

if [[ "$1" == "logout" ]]; then
  hyprshutdown
fi

if [[ "$1" == "lock" ]]; then
  echo ":: Lock"
  hyprlock
fi

if [[ "$1" == "reboot" ]]; then
  systemctl reboot
fi

if [[ "$1" == "shutdown" ]]; then
  systemctl poweroff
fi

if [[ "$1" == "suspend" ]]; then
  systemctl suspend -i
fi

if [[ "$1" == "hibernate" ]]; then
  sleep 1; 
  systemctl hibernate
fi
