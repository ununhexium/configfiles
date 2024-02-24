#!/bin/bash

function lock_no_pic {
  env | grep I3SOCK 
  if [[ $? -eq 0 ]]; then
    i3lock -f
  else
    swaylock -f
  fi
}

function lock_with_pic {
  env | grep I3SOCK 
  if [[ $? -eq 0 ]]; then
    i3lock -f -i "$1"
  else
    swaylock -f -i "$1"
  fi
}

if ! command -v hexpxl 2>&1 /dev/null ; then
  lock_no_pic
else
  screen='/tmp/screen'
  scrot -o "$screen.jpg"
  hexpxl "$screen.jpg" "$screen.png" 15 --mode hex
  rm "$screen.jpg"
  lock_with_pic "$screen.png"
fi
