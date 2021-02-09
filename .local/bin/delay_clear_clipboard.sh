#!/bin/sh
sleep "$1"

if [ -n "$WSLENV" ]; then
    echo "" | clip.exe
elif [ -n "$WAYLAND_DISPLAY" ]; then
    wl-copy -c
elif [ -n "$DISPLAY" ]; then
    echo "" | xclip
fi
