#!/bin/sh
#        author: Andrii Lytvyn (lytvyn349@gmail.com)
#         POSIX: yes
#   description: reset reshift changes to color temperature
#      required: redshift, kill

killall redshift
redshift -x
