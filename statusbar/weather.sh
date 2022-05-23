#!/bin/sh

city="Lviv"
city="Kryviy%20Rih"

status()
{
    emoji=$(curl -s wttr.in/$city?format='%c')
    temp=$(curl -s wttr.in/$city?format='%f')
    msg="$(curl -s wttr.in/$city?format='%C' | trans en:uk -b)"

    echo "$emoji$msg $temp"
}

status
