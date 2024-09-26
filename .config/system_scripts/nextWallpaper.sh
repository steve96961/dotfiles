#!/bin/bash

WALLPAPER_DIR="$HOME/.wallpapers"
CURRENT_WALLPAPER_FILE="$HOME/.current_wallpaper"

# Get the list of wallpapers
wallpapers=($WALLPAPER_DIR/*)

# Determine the current wallpaper
if [[ -f $CURRENT_WALLPAPER_FILE ]]; then
    current_wallpaper=$(cat "$CURRENT_WALLPAPER_FILE")
    current_index=-1
    for i in "${!wallpapers[@]}"; do
        if [[ "${wallpapers[$i]}" == "$current_wallpaper" ]]; then
            current_index=$i
            break
        fi
    done
else
    current_index=-1
fi

# Select the next wallpaper
next_index=$(( (current_index + 1) % ${#wallpapers[@]} ))
next_wallpaper="${wallpapers[$next_index]}"

swww img --transition-type grow --transition-pos  0.86,0.909 --transition-step 90 $next_wallpaper

# Save the current wallpaper
echo "$next_wallpaper" > "$CURRENT_WALLPAPER_FILE"

echo "Wallpaper changed to $next_wallpaper on all monitors"

