#!/usr/bin/env bash

#echo '\udb84\udd04'

GPU_TEMP=$(gpustat --json | jq --raw-output '.gpus[0]["temperature.gpu"]')

# Full and short texts
echo "$GPU_TEMP °C"
echo "$GPU_TEMP °C"

exit 0
