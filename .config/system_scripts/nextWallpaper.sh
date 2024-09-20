#!/bin/bash

WALLPAPER_DIR="$HOME/.wallpapers"
CURRENT_WALLPAPER_FILE="$HOME/.current_wallpaper"

# Get the list of wallpapers
wallpapers=($WALLPAPER_DIR/*)

# Determine the current wallpaper
if [[ -f $CURRENT_WALLPAPER_FILE ]]; then
    current_wallpaper=$(cat "$CURRENT_WALLPAPER_FILE")
    hyprctl hyprpaper unload $current_wallpaper
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

hyprctl hyprpaper preload "$next_wallpaper"

# Get the list of monitors
monitors=$(hyprctl monitors | grep "ID" | awk '{print $2}')

# Loop through each monitor and apply the wallpaper
for monitor in $monitors; do
    hyprctl hyprpaper wallpaper "$monitor,$next_wallpaper"
done

# Save the current wallpaper
echo "$next_wallpaper" > "$CURRENT_WALLPAPER_FILE"

echo "Wallpaper changed to $next_wallpaper on all monitors"

