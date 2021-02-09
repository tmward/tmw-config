#!/bin/sh

# default length 15
plength=15
if [ -n "$1" ]; then
    plength=$1
fi

pass=$(< /dev/urandom tr -C -d "[:alnum:]" | dd bs="$plength" count=1 2>/dev/null)

# copy password to clipboard and clear after 30 seconds
clipper.sh "$pass" 30
