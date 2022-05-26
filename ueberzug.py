#!/bin/python3

# =============================================================================
#
#        author: Andrii Lytvyn (lytvyn349@gmail.com)
#   description: draw images in terminal using ueberzug library
#          args: $1 - image path
#                $2 - display time
#                $3 - position x
#                $4 - position y
#                $5 - width
#                $6 - height
#
# =============================================================================

import ueberzug.lib.v0 as ueberzug
import time, sys

def draw(path, delay, x, y, width, height):
    with ueberzug.Canvas() as c:
        img = c.create_placement('cover', x=x, y=y, width=width, height=height,
                                  scaler=ueberzug.ScalerOption.COVER.value, synchronously_draw=True)
        img.path = path
        img.visibility = ueberzug.Visibility.VISIBLE

        time.sleep(delay)


if __name__ == '__main__':
    if len(sys.argv) > 7:
        print("Too much arguments passed")
        exit(1)
    elif len(sys.argv) < 7:
        print("Not enough arguments passed")
        exit(1)

    try:
        draw(sys.argv[1],
             int(sys.argv[2]),
             int(sys.argv[3]),
             int(sys.argv[4]),
             int(sys.argv[5]),
             int(sys.argv[6]))
    except Exception:
        print("Incorrect arguments provided")
        exit(1)
