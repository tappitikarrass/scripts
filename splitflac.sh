#!/bin/sh

# =============================================================================
#
#        author: Andrii Lytvyn (lytvyn349@gmail.com)
#         POSIX: yes
#   description: split album flac into tracks and tag them using cuesheet
#      required: cuetools, shntool, basename
#          args: $1 - cuefile or flac file path
#                     (provided that filenames are equal)
#
# =============================================================================

split()
{
    filename="$(basename "$1")"

    shnsplit -f "$filename"."cue" -t "%n. %t" -o flac "$filename"."flac"
    cuetag.sh "$filename"."cue" [0-9]*.flac
}

split "$1"
