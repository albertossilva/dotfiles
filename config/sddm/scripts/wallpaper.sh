#!/bin/bash
cache_file="$HOME/.cache/current_wallpaper"
sleep 1
clear
figlet "Set Wallpaper"
echo
echo "Set the current wallpaper as SDDM wallpaper."
echo
if [ ! -d /etc/sddm.conf.d/ ]; then
    sudo mkdir /etc/sddm.conf.d
    echo "Folder /etc/sddm.conf.d created."
fi

sudo cp $HOME/.config/sddm/sddm.conf /etc/sddm.conf.d/
echo "File /etc/sddm.conf.d/sddm.conf updated."

current_wallpaper=$(cat "$cache_file")
extension="${current_wallpaper##*.}"

sudo cp $current_wallpaper /usr/share/sddm/themes/sugar-candy/Backgrounds/current_wallpaper.$extension
echo "Current wallpaper copied into /usr/share/sddm/themes/sugar-candy/Backgrounds/"
new_wall=$(echo $current_wallpaper | sed "s|$HOME/wallpaper/||g")
sudo cp $HOME/.config/sddm/theme.conf /usr/share/sddm/themes/sugar-candy/
sudo sed -i 's/CURRENTWALLPAPER/'"current_wallpaper.$extension"'/' /usr/share/sddm/themes/sugar-candy/theme.conf

echo "File theme.conf updated in /usr/share/sddm/themes/sugar-candy/"

echo "DONE! Please logout to test sddm."
sleep 3
