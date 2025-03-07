#!/usr/bin/env bash

temp=$(sensors k10temp-pci-00c3 | grep 'Tctl:' | awk '{ print $2 }' | cut -d '+' -f2 | cut -d '.' -f1)
color=$(
  gradient -c 'rgb(128,128,128)' 'rgb(128,128,128)' 'rgb(128,128,128)' 'rgb(128,128,128)' 'rgb(255,255,0)' 'rgb(255,0,0)' 'rgb(255,0,255)' \
    --sample $(echo "scale=2;$temp/100" | bc) \
    --format hex \
    | tail -n 1
)

echo '<span foreground="'$color'">'$temp'°C</span>'

