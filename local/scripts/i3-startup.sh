#!/usr/bin/env bash

case "$(hostname)" in
  mind)
    firefox &
    ;;
  makemake)
    chromium &
    firefox &
    idea.sh &
    ;;
esac
