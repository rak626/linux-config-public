#!/bin/bash

devices=$(bluetoothctl devices Connected | cut -d ' ' -f3-)

if [ -z "$devices" ]; then
    echo '{"text":"","tooltip":"No devices"}'
else
    tooltip=$(echo "$devices" | sed 's/,/\n/g')
    echo "{\"text\":\"\",\"tooltip\":\"$tooltip\"}"
fi