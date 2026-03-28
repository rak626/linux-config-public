#!/bin/bash

DIR=~/Pictures/screenshots
FILE="$DIR/$(date +'%Y-%m-%d_%H-%M-%S').png"

mkdir -p "$DIR"

case "$1" in
    full)
        grim "$FILE"
        ;;
    area)
        grim -g "$(slurp)" "$FILE"
        ;;
    *)
        echo "Usage: screenshot.sh [full|area]"
        exit 1
        ;;
esac

# Copy to clipboard
wl-copy < "$FILE"

# Notification
notify-send "  Screenshot" "Saved & copied to clipboard"