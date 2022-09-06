#!/usr/bin/env bash

critical=95
high=80
mid=70
low=60

if [ -z ${temp+x} ]; then
    temp=$(sensors -u k10temp-pci-00c3 | grep temp1_input | awk '{print $2}' | cut -d\. -f1)
fi

function echox2 {
    echo $1
    echo $1
}

if [[ $temp > $critical ]]; then
    echox2 " $temp°C"
    echo "#FF00FF"
elif [[ $temp > $high ]]; then
    echox2 " $temp°C"
    echo "#FFFF00"
elif [[ $temp > $mid ]]; then
    echox2 " $temp°C"
elif [[ $temp > $low ]]; then
    echox2 " $temp°C"
else
    echox2 " $temp°C"
    echo "#00FFFF"
fi

graphite monitoring.cpu.temperature $temp

exit 0
