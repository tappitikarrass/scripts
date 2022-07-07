#!/bin/sh

# =============================================================================
#
#        author: Andrii Lytvyn (lytvyn349@gmail.com)
#         POSIX: yes
#   description: set screen video wallpaper.
#      required: xwinwrap-baitinq-git, mpv
#          args: $1 - file path
#
# =============================================================================

FP="$1"
[ -z "$FP" ] && exit 1

xwinwrap -ov -r -fs -- mpv -wid WID "$FP" --loop --video-unscaled --mute
