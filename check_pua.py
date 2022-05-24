#!/bin/python3
#        author: Andrii Lytvyn (lytvyn349@gmail.com)
#   description: print unicode private use area glyphs. useful to check fonts which provide icons

def print_pua(s, len):
    count = 0
    for i in s:
        if (count < len):
            count += 1
        else:
            print()
            count = 0

        print(i, end="   ")

s = ""
len = 20
print_pua(s, len)
