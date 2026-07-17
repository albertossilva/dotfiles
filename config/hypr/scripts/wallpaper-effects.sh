    #!/bin/bash

    # Open rofi to select the Hyprshade filter for toggle
    options="$(ls ~/.config/hypr/effects/wallpaper/)\noff"
    
    # Open rofi
    choice=$(echo -e "$options" | rofi -dmenu -replace -config ~/.config/rofi/config-themes.rasi -i -no-show-icons -l 5 -width 30 -p "Hyprshade") 
    if [ ! -z $choice ] ;then
        echo "$choice" > ~/.config/.settings/wallpaper-effect.sh
        dunstify "Changing Wallpaper Effect to " "$choice"
        ~/.config/hypr/scripts/wallpaper.sh
    fi