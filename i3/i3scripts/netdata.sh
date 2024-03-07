#!/usr/bin/env bash

if [[ $BLOCK_BUTTON -eq 1 ]]
then
  xdg-open "http://localhost:19999/" 2>&1 > /dev/null
  i3-msg "workspace number 1" 2>&1 > /dev/null
fi


alarms=$(curl http://localhost:19999/api/v1/info | jq '.alarms')
normal=$(echo $alarm | jq .normal)
warning=$(echo $alarm | jq .warning)
critical=$(echo $alarm | jq .critical)

if [[ $critical -gt 0 ]]
then
  echo "<span color='red'><big> </big>$critical</span>"
fi

if [[ $warning -gt 0 ]]
then
  echo "<span color='yellow'><big> </big>$warning</span>"
fi

if [[ $critical -eq 0 && $warning -eq 0 ]]
then
  echo "<span size='xx-large'></span>"
fi
