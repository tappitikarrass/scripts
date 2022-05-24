#!/bin/sh
#        author: Andrii Lytvyn (lytvyn349@gmail.com)
#         POSIX: yes
#   description: cmus update script
#      required: cmus, dwmblocks-async, kill, pidof


kill -40 $(pidof dwmblocks)
