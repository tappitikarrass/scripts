#!/bin/sh

# =============================================================================
#
#        author: Andrii Lytvyn (lytvyn349@gmail.com)
#   description: dwmblocks statusbar script
#         POSIX: yes
#      required: grep, awk, xargs, echo,
#                sed, pactl(pulseaudio), cat
#                date, trans(translate-shell), curl
#
# =============================================================================

pa_mic() {
	muted=$(pactl list sources | grep Mute | sed "1d;3,4d" | grep yes)

	[ -z "$muted" ] && icon="  "

	echo "$icon"
}

pa_vol() {
	vol=$(pactl list sinks | grep Volume | sed "2,4d" | awk '{print $5}' | sed "s/%//")
	mute=$(pactl list sinks | grep Mute | sed 2d | grep yes)

	[ -z "$mute" ] && icon="墳  " || icon="ﱝ  "

	echo "$icon$vol%"
}

bat() {
	capacity=$(cat /sys/class/power_supply/BAT0/capacity)
	ac=$(cat /sys/class/power_supply/AC/online)

	[ "$ac" -eq "0" ] && icon="  " || icon="ﮣ  "

	echo "$icon$capacity%"
}

date() {
	LANG=uk_UA.utf8
	echo "$(/bin/date "+%A %d %B" | sed 's/./\U&/') $(/bin/date "+%R:%S")"
}

weather() {
	city="Lviv"
	# city="Kryviy%20Rih"

	emoji=$(curl -s wttr.in/$city?format='%c')
	temp=$(curl -s wttr.in/$city?format='%f')
	msg="$(curl -s wttr.in/$city?format='%C' | trans en:uk -b)"

	echo "$emoji$msg $temp"
}

case "$1" in
"date") date ;;
"wlan") wlan ;;
"cmus") cmus ;;
"pa_mic") pa_mic ;;
"pa_vol") pa_vol ;;
"bat") bat ;;
"weather") weather ;;
esac
