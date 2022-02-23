#!/bin/sh
# author: Andrii Lytvyn (lytvyn349@gmail.com)
# description: print battery capacity to stdout

capacity=$(cat /sys/class/power_supply/BAT0/capacity)
echo "$capacity%"
