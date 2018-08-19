#!/bin/bash

#windows=$(xdotool search --all --onlyvisible --desktop $(xprop -notype -root _NET_CURRENT_DESKTOP | cut -c 24-) "" 2>/dev/null)

#w=$(echo $windows | cut -f1 -d' ')
w=$(xdotool getwindowfocus)

eval $(xdotool getwindowgeometry --shell $(xdotool getwindowfocus))

x=$(echo $X + $WIDTH / 2 | bc)
y=$(echo $Y + $HEIGHT / 2 | bc)

xdotool mousemove $x $y click 1 mousemove 0 0

notify-send Click $x $y


