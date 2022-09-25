#!/bin/bash

screen='/tmp/screen'
scrot -o "$screen.jpg"

hexpxl "$screen.jpg" "$screen.png" 15 --mode hex

swaylock -f -i "$screen.png"


