#!/bin/sh
# author: Andrii Lytvyn (lytvyn349@gmail.com)
# description: split album flac into tracks and tag them using cuesheet
# required: cuetools; shntool;

CUE="$1"
FLAC="$2"

shnsplit -f "$CUE" -t "%n. %t" -o flac "$FLAC"
cuetag.sh "$CUE" [0-9]*.flac
