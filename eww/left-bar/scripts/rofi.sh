#!/bin/sh
pidfile="$XDG_RUNTIME_DIR/rofi.pid"

[ -s "$pidfile" ] && kill -INT $(<$pidfile) >/dev/null 2>&1

exec rofi -show drun &
