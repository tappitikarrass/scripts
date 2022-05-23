#!/bin/python3

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
