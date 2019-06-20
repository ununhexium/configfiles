#!/bin/bash

screen='/tmp/screen'
scrot "$screen.jpg"

here=$(dirname "$0")

hexpxl "$screen.jpg" "$screen.png" 15 --mode hex

i3lock -f -i "$screen.png"


