#!/bin/sh
# author: Andrii Lytvyn (lytvyn349@gmail.com)
# description: print volume status to stdout
# required: pactl; awk; ttf-material-design-iconic-font;

status ()
{
    vol=$(pactl list sinks | grep Volume | sed "2,4d" | awk '{print $5}'| sed "s/%//")
    mute=$(pactl list sinks | grep Mute | sed 2d | grep yes)

    [ -z "$mute" ] && icon="" || icon=""

    echo "$icon$vol%"
}

status
