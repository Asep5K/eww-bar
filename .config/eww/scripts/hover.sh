#!/bin/bash

workspace=$1
preview="/tmp/$workspace.png"
addr=$(hyprctl -j clients | jq -r --arg ws "$workspace" '.[] | select(.workspace.id == ($ws | tonumber)and .visible == true) | .address')
if [ -n "$addr" ]; then
    grim -t png -l 0 -w "$addr" "$preview"
else
    preview="$HOME/.config/hypr/wallpaper/1.jpg"
fi

eww update img_path="$preview"
