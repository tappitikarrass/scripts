#!/bin/sh

# =============================================================================
#
#        author: Andrii Lytvyn (lytvyn349@gmail.com)
#         POSIX: yes
#   description: cmus update script. includes album art display
#      required: cmus, dwmblocks-async, kill, pidof, feh, awk, xdotool
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
    window_width="$(xdotool getactivewindow getwindowgeometry | grep ' Geometry: ' | awk '{ print $2 }'| cut -d 'x' -f1)"
    window_height="$(xdotool getactivewindow getwindowgeometry | grep ' Geometry: ' | awk '{ print $2 }'| cut -d 'x' -f2)"

    size=200
    w="$(echo "$window_width - $size - 4" | bc)" 
    h="$(echo "$window_height - $size - 3 - 21" | bc)" 
    
    feh --class albumcover -. -g "$size"x"$size"+"$w"+"$h" "$1" &
}

draw()
{
    img_path="$(cmus-remote -Q | grep 'file ' | sed 's/file //;s:[^/]*$::')"

    [ -f "$img_path""$1" ] && feh_cmd "$img_path""$1"
    xsetroon -name "fsignal:2"
    xsetroon -name "fsignal:2"
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
