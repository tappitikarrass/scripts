#!/bin/sh

wlan()
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

pa_mic()
{
    muted=$(pactl list sources | grep Mute | sed "1d;3,4d" | grep yes)

    [ -z "$muted" ] && icon="REC"

    echo "$icon"
}

pa_vol()
{
    vol=$(pactl list sinks | grep Volume | sed "2,4d" | awk '{print $5}'| sed "s/%//")
    mute=$(pactl list sinks | grep Mute | sed 2d | grep yes)

    [ -z "$mute" ] && icon="" || icon=""

    echo "$icon$vol%"
}

bat()
{
    capacity=$(cat /sys/class/power_supply/BAT0/capacity)
    ac=$(cat /sys/class/power_supply/AC/online)

    [ "$ac" -eq "0" ] && icon="" || icon=""

    echo "$icon$capacity%"
}

date()
{
    LANG=uk_UA.utf8

    echo "$(date "+%A %d %B" | sed 's/./\U&/') $(date "+%R:%S")"
}

cmus()
{
    title="$(cmus-remote -Q | grep 'tag title' | sed 's/tag title //')"
    artist="$(cmus-remote -Q | grep 'tag artist' | sed 's/tag artist //')"
    status="$(cmus-remote -Q | grep 'status' | sed 's/status //')"

    [ "$status" = "playing" ] && status=""
    [ "$status" = "paused" ] && status=""
    
    [ -z "$title" ] || [ -z "$artist" ] && exit 0
    echo " $artist - $title $status"
}

weather()
{
    city="Lviv"
    city="Kryviy%20Rih"

    emoji=$(curl -s wttr.in/$city?format='%c')
    temp=$(curl -s wttr.in/$city?format='%f')
    msg="$(curl -s wttr.in/$city?format='%C' | trans en:uk -b)"

    echo "$emoji$msg $temp"
}

case "$1" in
    "wlan") wlan ;;
    "cmus") cmus ;;
    "pa_mic") pa_mic ;;
    "pa_vol") pa_vol ;;
    "bat") bat ;;
    "date") date ;;
    "weather") weather ;;
esac
