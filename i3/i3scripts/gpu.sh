#!/usr/bin/env bash

#echo '\udb84\udd04'

STATS=$(gpustat --json)
[[ $? -ne 0 ]] && exit 1
GPU_TEMP=$(echo "$STATS" | jq --raw-output '.gpus[0]["temperature.gpu"]')
GPU_MEMORY=$(echo "$STATS" | jq --raw-output '.gpus[0]["memory.used"]')
GPU_TOTAL_MEMORY=$(echo "$STATS" | jq --raw-output '.gpus[0]["memory.total"]')
GPU_USAGE=$(echo "$STATS" | jq --raw-output '.gpus[0]["utilization.gpu"]')

# Full and short texts
echo "<span size='xx-large'> </span>  ${GPU_TEMP}°C  $( echo "scale=1; 100 * $GPU_MEMORY / $GPU_TOTAL_MEMORY" | bc)% $(printf "% 3d" ${GPU_USAGE})%"
echo "${GPU_TEMP}C"

exit 0
