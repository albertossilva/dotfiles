#!/bin/bash
# ----------------------------------------------------- 
# Check to use wallpaper cache
# ----------------------------------------------------- 

use_cache=0
if [ -f $HOME/.config/.settings/wallpaper_cache ] ;then
    use_cache=1
fi

if [ "$use_cache" == "1" ] ;then
    echo ":: Using Wallpaper Cache"
else
    echo ":: Wallpaper Cache disabled"
fi

# ----------------------------------------------------- 
# Set defaults
# ----------------------------------------------------- 

force_generate=0
generated_versions="$HOME/.cache/ml4w-wallpaper-generated"
cache_file="$HOME/.cache/current_wallpaper"
blurred_wallpaper="$HOME/.cache/blurred_wallpaper.png"
square_wallpaper="$HOME/.cache/square_wallpaper.png"
rasi_file="$HOME/.cache/current_wallpaper.rasi"
blur_file="$HOME/.config/.settings/blur.sh"
default_wallpaper="~/wallpaper/evening-landscape.jpg"
blur="50x30"
blur=$(cat $blur_file)

# Create folder with generated versions of wallpaper if not exists
if [ ! -d $generated_versions ] ;then
    mkdir $generated_versions
fi

# ----------------------------------------------------- 
# Get selected wallpaper
# ----------------------------------------------------- 

if [ -z $1 ] ;then
    if [ -f $cache_file ] ;then
        wallpaper=$(cat $cache_file)
    else
        wallpaper=$default_wallpaper
    fi
else
    wallpaper=$1
fi
used_wallpaper=$wallpaper
echo ":: Setting wallpaper with original image $wallpaper"

# ----------------------------------------------------- 
# Copy path of current wallpaper to cache file
# ----------------------------------------------------- 

if [ ! -f $cache_file ] ;then
    touch $cache_file
fi
echo "$wallpaper" > $cache_file
echo ":: Path of current wallpaper copied to $cache_file"

# ----------------------------------------------------- 
# Get wallpaper filename
# ----------------------------------------------------- 
wallpaper_filename=$(basename $wallpaper)
echo ":: Wallpaper Filename: $wallpaper_filename"

# ----------------------------------------------------- 
# Execute pywal
# ----------------------------------------------------- 

echo ":: Execute pywal with $wallpaper"
wal -q -i $wallpaper
source "$HOME/.cache/wal/colors.sh"

# ----------------------------------------------------- 
# Wallpaper Effects
# -----------------------------------------------------

if [ -f $HOME/.config/.settings/wallpaper-effect.sh ] ;then
    effect=$(cat $HOME/.config/.settings/wallpaper-effect.sh)
    if [ ! "$effect" == "off" ] ;then
        used_wallpaper=$generated_versions/$effect-$wallpaper_filename
        if [ -f $generated_versions/$effect-$wallpaper_filename ] && [ "$force_generate" == "0" ] && [ "$use_cache" == "1" ] ;then
            echo ":: Use cached wallpaper $effect-$wallpaper_filename"
        else
            echo ":: Generate new cached wallpaper $effect-$wallpaper_filename with effect $effect"
            dunstify "Using wallpaper effect $effect..." "with image $wallpaper_filename" -h int:value:10 -h string:x-dunst-stack-tag:wallpaper
            source $HOME/.config/hypr/effects/wallpaper/$effect
        fi
        echo ":: Loading wallpaper $generated_versions/$effect-$wallpaper_filename with effect $effect"
    else
        echo ":: Wallpaper effect is set to off"
    fi
fi

# ----------------------------------------------------- 
# Write hyprpaper.conf
# -----------------------------------------------------

echo ":: Setting wallpaper with $used_wallpaper"
killall -e hyprpaper & 
sleep 1; 
wal_tpl=$(cat $HOME/.config/.settings/hyprpaper.tpl)
output=${wal_tpl//WALLPAPER/$used_wallpaper}
echo "$output" > $HOME/.config/hypr/hyprpaper.conf
hyprpaper & > /dev/null 2>&1

# ----------------------------------------------------- 
# Reload Waybar
# -----------------------------------------------------
# ~/.config/waybar/launch.sh

# ----------------------------------------------------- 
# Created blurred wallpaper
# -----------------------------------------------------

echo ":: Generate new cached wallpaper blur-$blur-$wallpaper_filename with blur $blur"
magick $wallpaper -resize 75% $blurred_wallpaper
echo ":: Resized to 75%"
if [ ! "$blur" == "0x0" ] ;then
    magick $blurred_wallpaper -blur $blur $blurred_wallpaper
    cp $blurred_wallpaper $generated_versions/blur-$blur-$wallpaper_filename.png
    echo ":: Blurred"
fi
cp $generated_versions/blur-$blur-$wallpaper_filename.png $blurred_wallpaper

# ----------------------------------------------------- 
# Create rasi file
# ----------------------------------------------------- 

if [ ! -f $rasi_file ] ;then
    touch $rasi_file
fi
echo "* { current-image: url(\"$blurred_wallpaper\", height); }" > "$rasi_file"

# ----------------------------------------------------- 
# Created square wallpaper
# -----------------------------------------------------

echo ":: Generate new cached wallpaper square-$wallpaper_filename"
magick $wallpaper -gravity Center -extent 1:1 $square_wallpaper
cp $square_wallpaper $generated_versions/square-$wallpaper_filename.png
