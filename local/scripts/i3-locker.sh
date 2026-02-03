#!/bin/bash

notify-send --app-name i3-locker --urgency low low 'Locking...'

screen='/tmp/screen'
scrot --silent --overwrite "$screen.jpg"

hexpxl "$screen.jpg" "$screen.png" 15 --mode hex

i3lock --show-failed-attempts --image="$screen.png"


