#!/usr/bin/env bash

notify-send --app-name App1 --urgency low low 'Message body'
notify-send --app-name App2 --urgency normal normal 'Message body'
notify-send --app-name App3 --urgency critical critical 'Message body'
notify-send --app-name App4 --urgency normal Progress --hint int:value:69 'Nice!'
notify-send --icon emoji-nature-symbolic --app-name 'Iconified' 'This has an icon' 'This is nature'
notify-send --hint string:value:'http://example.com' 'Example.com'

dunstify --raw_icon ./arch.png --appname 'Arch Linux' 'This has a custom icon' 'This is Arch'



#notify-send --app-name Corporate --urgency low 'Long message' 'Message body that is very long and requires much more space than the others, for isntance when someone sends a chat message and had a lot of things to say. Hopefully this will be displayed correctly and not overflow on your whole screen. But who knows, maybe it will. If such is the case, then sinply adjust dunst to shorten the message'"'"'s body. Just to be sure that this is long enough to overflow, I will now paste some Lorem Ipsum: Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.'
