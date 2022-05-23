#!/bin/sh

status()
{
    icon=""
    if grep -q wl* "/proc/net/wireless"; then
        percentage="$(grep "^\s*w" /proc/net/wireless | awk '{ print "", int($3 * 100 / 70)}'| xargs)"

        [ "$percentage" -gt "0" ] && icon=""
        [ "$percentage" -gt "25" ] && icon=""
        [ "$percentage" -gt "50" ] && icon=""
        [ "$percentage" -gt "75" ] && icon=""
    fi

    echo "$icon"
}

status
