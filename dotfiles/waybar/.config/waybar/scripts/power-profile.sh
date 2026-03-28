#!/bin/bash

current=$(powerprofilesctl get)

# Toggle if clicked
if [[ "$1" == "toggle" ]]; then
    case "$current" in
        performance) powerprofilesctl set balanced ;;
        balanced) powerprofilesctl set power-saver ;;
        power-saver) powerprofilesctl set performance ;;
    esac

    current=$(powerprofilesctl get)

    # 🔔 Send notification AFTER change
    case "$current" in
        performance)
            notify-send "Power Mode" "Performance  "
            ;;
        balanced)
            notify-send "Power Mode" "Balanced  "
            ;;
        power-saver)
            notify-send "Power Mode" "Power Saver "
            ;;
    esac
fi

# 🧾 Waybar JSON output (must be last, clean stdout)
case "$current" in
    performance)
        echo '{"text": " ", "class": "performance"}'
        ;;
    balanced)
        echo '{"text": " ", "class": "balanced"}'
        ;;
    power-saver)
        echo '{"text": " ", "class": "power-saver"}'
        ;;
esac