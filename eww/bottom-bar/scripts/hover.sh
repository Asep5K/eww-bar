#!/bin/bash

ws=$1
preview="/tmp/.preview.png"
addr=$(hyprctl -j clients | jq -r --arg ws "$ws" '.[] | select(.workspace.id == ($ws | tonumber)and .visible == true) | .address' | head -1)
if [ -n "$addr" ]; then
    grim -t png -l 0 -w "$addr" "$preview"
else
    preview="$HOME/.config/hypr/wallpaper/1.jpg"
fi

eww -c "$XDG_CONFIG_HOME/eww/bar" update img_path="$preview"
