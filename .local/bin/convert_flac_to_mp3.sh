#!/bin/sh

cd "$1" || exit

# vn says don't keep any embedded images
# -q:a 2 maps to -V2 for lame, essentially transparent

for F in *.flac; do
	ffmpeg -i "$F" -metadata comment="" -vn -codec:a libmp3lame -q:a 2 "${F%flac}mp3"
done
