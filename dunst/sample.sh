#!/usr/bin/env bash

notify-send --app-name App1 --urgency low low 'Message body'
notify-send --app-name Corporate --urgency low low 'Message body that is very long and requires much more space than the others'
notify-send --app-name App2 --urgency normal normal 'Message body'
notify-send --app-name App3 --urgency critical critical 'Message body'

