#!/bin/sh

# =============================================================================
#
#        author: Andrii Lytvyn (lytvyn349@gmail.com)
#         POSIX: yes
#   description: cmus update script. includes album art display
#      required: cmus, dwmblocks-async, kill, pidof, feh,
#                awk, xrandr, uniq, grep, xsetroot,
#                dwm(fsignal, canfocus)
#
# =============================================================================

DRAW_ART=1

update()
{
    kill -40 "$(pidof dwmblocks)"
}

clean()
{
    pkill feh
}

feh_cmd()
{
    screen_width="$(xrandr --current | grep '*' | uniq | awk '{ print $1 }'| cut -d 'x' -f1)"
    screen_height="$(xrandr --current | grep '*' | uniq | awk '{ print $1 }'| cut -d 'x' -f2)"

    size=200
    w="$(echo "$screen_width - $size - 4" | bc)" 
    h=18
    
    feh --class albumcover -. -B black -g "$size"x"$size"+"$w"+"$h" "$1" &
}

draw()
{
    img_path="$(cmus-remote -Q | grep 'file ' | sed 's/file //;s:[^/]*$::')"

    [ -f "$img_path""$1" ] && feh_cmd "$img_path""$1"
    xsetroot -name "fsignal:2"
    xsetroot -name "fsignal:2"
}

try_draw()
{
    clean
    for name in "cover.jpg" "cover.jpeg" "cover.png" "folder.jpg" "folder.jpeg" "folder.png"
    do
        draw $name
    done
}

update
[ "$DRAW_ART" -eq 1 ] && try_draw
