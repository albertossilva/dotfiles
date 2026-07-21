#!/bin/bash

if [ -z $1 ] ;then
    echo "Usage: wallpaper.sh <wallpaper_path>"
    exit 1
fi

wallpaper=$1

echo ":: Execute pywal with $wallpaper."
wallust run $wallpaper
echo ":: Applying theme"
source "$HOME/.cache/wal/colors.sh"

generated_versions="$HOME/.cache/generated"
blurred_wallpaper="$HOME/.cache/blurred_wallpaper.png"
square_wallpaper="$HOME/.cache/square_wallpaper.png"
rasi_file="$HOME/.cache/current_wallpaper.rasi"
blur_file="$HOME/.config/.settings/blur.sh"
blur="50x30"
blur=$(cat $blur_file)

echo ":: Guaranteeing generated folder"
# Create folder with generated versions of wallpaper if not exists
if [ ! -d $generated_versions ] ;then
    mkdir $generated_versions
fi

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

echo ":: Done"
