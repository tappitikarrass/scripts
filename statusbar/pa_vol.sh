#!/bin/sh
# author: Andrii Lytvyn (lytvyn349@gmail.com)
# description: print volume status to stdout
# required: pactl; awk; ttf-material-design-iconic-font;

PA_SVOL=$(pactl list sinks | grep Volume | sed "2,4d" | awk '{print $5}')
PA_SMUTE=$(pactl list sinks | grep Mute | sed 2d | grep yes)

[ -z "$PA_SMUTE" ] && SICON=""|| SICON=""

echo "$SICON $PA_SVOL"
