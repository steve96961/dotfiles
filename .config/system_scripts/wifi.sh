#!/usr/bin/env bash

# Start a scan of available broadcasting SSIDs
iwctl station wlan0 scan

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

FIELDS="SSID,SECURITY"
FONT="FiraCode Nerd Font 14"

if [ -r "$DIR/config" ]; then
    source "$DIR/config"
elif [ -r "$HOME/.config/fuzzel/wifi" ]; then
    source "$HOME/.config/fuzzel/wifi"
else
    echo "WARNING: config file not found! Using default values."
fi

# Get the list of available networks, remove ANSI codes, and clean up output
LIST=$(iwctl station wlan0 get-networks | \
    sed -n '/Available networks/,/^$/p' | \
    sed 's/\x1B\[[0-9;]*[a-zA-Z]//g' |  # Remove ANSI color codes
    awk 'NR>4 {print $1,$2,$3}' | \
    sed '/^$/d' | \
    sed '/^>/d' | \
    sed '/^\[.*$/d')  # Remove remaining malformed lines

# Calculate the width dynamically
RWIDTH=$(($(echo "$LIST" | head -n 1 | awk '{print length($0); }') + 2))
LINENUM=$(echo "$LIST" | wc -l)

# Check known connections (to speed up connections later)
KNOWNCON=$(iwctl known-networks list)

# Get the current connection SSID
CURRSSID=$(iwctl station wlan0 show | grep "Connected network" | awk '{print $3}')

if [[ ! -z $CURRSSID ]]; then
    HIGHLINE=$(( $(echo "$LIST" | awk '{print $1}' | grep -Fxn -m 1 "$CURRSSID" | awk -F ":" '{print $1}') + 1 ))
fi

# Limit the number of lines to display
if [ "$LINENUM" -gt 8 ]; then
    LINENUM=8
fi

# Present the network list in fuzzel for selection
CHENTRY=$(echo -e "manual\n$LIST" | fuzzel -d -p "Wi-Fi SSID: " -l "$LINENUM" -w "$RWIDTH" --font "$FONT")
CHSSID=$(echo "$CHENTRY" | awk '{$1=$1};1')  # Trim leading/trailing spaces

# Ensure that a valid SSID was selected
if [[ -z "$CHSSID" || "$CHSSID" == "manual" || "$CHSSID" == ">" ]]; then
    echo "No valid SSID selected."
    exit 1
fi

# If the user inputs "manual" as their SSID, prompt for manual entry
if [ "$CHENTRY" = "manual" ] ; then
    MSSID=$(echo "Enter the SSID of the network (SSID,password)" | fuzzel -d -p "Manual Entry: " --font "$FONT" -l 1)
    MPASS=$(echo "$MSSID" | awk -F "," '{print $2}')

    if [ "$MPASS" = "" ]; then
        iwctl station wlan0 connect "$MSSID"
    else
        iwctl station wlan0 connect "$MSSID" --passphrase "$MPASS"
    fi

else
    # Connect to the selected network
    if [[ $(echo "$KNOWNCON" | grep "$CHSSID") = "$CHSSID" ]]; then
        iwctl station wlan0 connect "$CHSSID"
    else
        WIFIPASS=$(echo "if connection is stored, hit enter" | fuzzel -d -p "Password: " --font "$FONT" -l 1)
        iwctl station wlan0 connect "$CHSSID" --passphrase "$WIFIPASS"
    fi
fi

