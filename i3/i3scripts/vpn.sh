#!/usr/bin/env bash

ip address show dev tun0 | grep inet > /dev/null 2>&1

if [[ $? -eq 0 ]]
then
  echo -n "<span size='xx-large'>󰒄󰠅</span>"
fi

ip address show dev enp1s0f0 | grep inet 2>&1 > /dev/null

if [[ $? -eq 0 ]]
then
  echo -n "<span size='xx-large'>󰛳</span>"
fi

echo
