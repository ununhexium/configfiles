#!/usr/bin/env bash

case $(hostname) in
	mind) temp=$(echo "$(cat /sys/class/thermal/thermal_zone2/temp) / 1000" | bc)
esac

echo "${temp}°C"

