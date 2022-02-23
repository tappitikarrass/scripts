#!/bin/sh
# author: Andrii Lytvyn (lytvyn349@gmail.com)
# description: print microphone mute status icon to stdout
# required: pulseaudio; pactl; ttf-material-design-iconic-font;

PA_MMUTE=$(pactl list sources | grep Mute | sed "1d;3,4d" | grep yes)

[ -z "$PA_MMUTE" ] && MICON=""|| MICON=""

echo "$MICON"
