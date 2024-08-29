#!/bin/sh

FZF_DEFAULT_OPTS=""
khard email -p | \
	fzf -n 2 -d '\t' --height 40% -m --reverse -q "$1" |
	awk -F '\t' '{ printf "<%s> %s\n", $2, $1 }'
