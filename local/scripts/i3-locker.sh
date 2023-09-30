#!/bin/bash

screen='/tmp/screen'
scrot -o "$screen.jpg"

hexpxl "$screen.jpg" "$screen.png" 15 --mode hex

i3lock -f -i "$screen.png"


