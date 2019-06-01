#!/usr/bin/env bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

source "$DIR/cpu_usage_location.sh"

[[ ! -e $(dirname "$cpu_usage_location") ]] && mkdir -p $(dirname "$cpu_usage_location")
echo "N/A" > touch "$cpu_usage_location"

usage=$(echo "scale=1 ; 100 - "$(mpstat 1 1 -o JSON | jq '.sysstat.hosts[0].statistics[0]."cpu-load"[0].idle') | bc)
# only write that on tmpfs as it would otherwise incur useless disk write and cells deterioration
[[ -z $(df $(dirname "$cpu_usage_location") | tail -n1 | grep '^tmpfs') ]] && echo "Won't write on non tmpfs" && exit 1

echo "$usage" > "$cpu_usage_location"

