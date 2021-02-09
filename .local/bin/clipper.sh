#!/bin/sh

# copies first argument to appropriate clipboard for window manager and
# operating system
# optional second argument delays clearing the clipboard for that may seconds


if [ -n "$WSLENV" ]; then
    echo "$1" | clip.exe
elif [ -n "$WAYLAND_DISPLAY" ]; then
    echo "$1" | wl-copy
elif [ -n "$DISPLAY" ]; then
    echo "$1" | xclip
fi

if [ -n "$2" ]; then
    delay_clear_clipboard.sh "$2" &
fi
