#!/bin/sh
# author: Andrii Lytvyn (lytvyn349@gmail.com)
# description: print date and time to stdout
# required: uk_UA.utf8 locale;

status()
{
    LANG=uk_UA.utf8

    echo "$(date "+%A %d %B" | sed 's/./\U&/') $(date "+%R:%S")"
}

status
