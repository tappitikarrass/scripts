#!/bin/sh

status()
{
    title="$(cmus-remote -Q | grep 'tag title' | sed 's/tag title //')"
    artist="$(cmus-remote -Q | grep 'tag artist' | sed 's/tag artist //')"
    status="$(cmus-remote -Q | grep 'status' | sed 's/status //')"

    [ "$status" = "playing" ] && status=""
    [ "$status" = "paused" ] && status=""
    
    [ -z "$title" ] || [ -z "$artist" ] && exit 0
    echo " $artist - $title $status"
}

status
