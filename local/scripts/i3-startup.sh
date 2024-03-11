#!/usr/bin/env bash

case $(hostname) in
  mind)
    firefox
    ;;
  makemake)
    firefox
    chromium
    ;;
esac
