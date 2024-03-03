#!/usr/bin/bash

last="/tmp/battery/last"
dir=$(dirname "$last")
[[ ! -d "$dir" ]] && mkdir -p "$dir"

# Battery level
# TODO: rename in udev
l=$(cat /sys/class/power_supply/{BAT0,CMB0}/capacity)
status=$(cat /sys/class/power_supply/{BAT0,CMB0}/status)
#l=4
# low level alert
low=20
crit=10

if [[ $BLOCK_BUTTON -eq 1 ]]
then
  level=$(echo "$l / 10 * 10" | bc)
  notify-send --urgency=normal --icon battery-level-$level-symbolic "Battery" --hint int:value:$l
fi

# Alert if level low
if [[ $(cat $last) -ne $l && "$status" != "Charging" ]]; then
  echo $l > $last
  level=$(echo "$l / 10 * 10" | bc)
  if [[ $l -le $crit ]]; then
    notify-send --urgency=critical --icon battery-level-$level-symbolic "Battery" --hint int:value:$l
  elif [[ $l -le $low && $(($l % 5)) -eq 0 ]]; then
    notify-send --urgency=normal --icon battery-level-$level-symbolic "Battery low!" --hint int:value:$l
  else
    // nada
  fi
fi


if [[ "$status" = "Full" ]]; then
  echo "<span size='xx-large' color='white'>󱈑</span>"
elif [[ "$status" = "Charging" ]]; then
  icons=(󰢟 󰢜 󰂆 󰂇 󰂈 󰢝 󰂉 󰢞 󰂊 󰂋 󰂅)
  color=(red orange yellow green green green green green green green cyan)
  # icons count
  c="${#icons[@]}"
  # index in the icons array
  i=$(echo "($l + 5) / ($c - 1)" | bc)

  echo "<span size='xx-large' color='${color[$i]}'>${icons[$i]}</span>"
else
  icons=(󰂎 󰁺 󰁻 󰁼 󰁽 󰁾 󰁿 󰂀 󰂁 󰂂 󰁹)
  color=(magenta red orange yellow white white white white white white cyan)
  # icons count
  c="${#icons[@]}"
  # index in the icons array
  i=$(echo "($l + 5) / ($c - 1)" | bc)

  echo "<span size='xx-large' color='${color[$i]}'>${icons[$i]}</span>"
fi

