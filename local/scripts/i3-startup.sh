#!/usr/bin/env bash

case "$(hostname)" in
  mind)
    firefox &
    ;;
  makemake)
    exec --no-startup-id i3-msg 'workspace 7; exec /usr/bin/chromium'
    chromium &
    firefox &
    idea.sh &
    ;;
esac
