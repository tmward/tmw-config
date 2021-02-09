#!/bin/sh

# sync clock with hardware clock. WSL gets out of sync with
# sleeping/hibernating. Use visudo so this command can run without a
# password
while true; do
    sudo hwclock -s
    sleep 3600
done
