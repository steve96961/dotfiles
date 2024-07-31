#!/bin/bash

# Check if Spotify is playing
spotify_status=$(playerctl --player=spotify status 2>/dev/null)

if [ "$spotify_status" = "Playing" ]; then
  # Get the current track details from Spotify
  song_info=$(playerctl --player=spotify metadata --format '{{title}}     {{artist}}')
else
  # Get the current player list
  players=$(playerctl -l 2>/dev/null)
  
  for player in $players; do
    if [ "$player" != "spotify" ]; then
      # Check if any other player is playing
      status=$(playerctl --player="$player" status 2>/dev/null)
      
      if [ "$status" = "Playing" ]; then
        # Get the current track details from the other player
        song_info=$(playerctl --player="$player" metadata --format '{{title}}     {{artist}}')
        echo "$song_info"
        exit 0
      fi
    fi
  done
  
  # If no player is playing
  song_info="No audio is currently playing."
fi

echo "$song_info"

