#!/bin/sh
# author: Andrii Lytvyn (lytvyn349@gmail.com)
# description: print microphone mute status icon to stdout
# required: pulseaudio; pactl; ttf-material-design-iconic-font;

status()
{
    muted=$(pactl list sources | grep Mute | sed "1d;3,4d" | grep yes)

    [ -z "$muted" ] && icon="REC"

    echo "$icon"
}

status
