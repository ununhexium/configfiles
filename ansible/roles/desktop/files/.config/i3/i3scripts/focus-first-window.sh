#!/bin/bash

eval $(xdotool getwindowgeometry --shell $(xdotool getwindowfocus))

x=$(echo $X + $WIDTH / 2 | bc)
y=$(echo $Y + $HEIGHT / 2 | bc)

xdotool mousemove $x $y click 1 mousemove 0 0

notify-send Click $x $y


