#!/usr/bin/bash

val="$(awk "BEGIN {print $1/100}")"
hyprctl eval "hl.window_rule({ match = { class = '^(?:foot(?:client)?|[Ss]potify)'}, opacity = "$val"})"
