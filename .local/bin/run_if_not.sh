#!/bin/sh

# really not amazing "process manager"
# tests if something is running, if it's not, then launch it
# need first grep to make sure we don't match this script before it
# launches the second instance
ps aux | grep -v "$0" | grep -E -q "/bin/sh.+$1$" || exec "$1" &
