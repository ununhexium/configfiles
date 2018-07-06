#!/bin/bash

screen='/tmp/screen.png'
scrot $screen

here=$(dirname "$0")

source ~/.virtualenv/locker/bin/activate
"$here/hexpixel/hexpxl.py" --input $screen --output $screen

i3lock -f -i /tmp/screen.png


