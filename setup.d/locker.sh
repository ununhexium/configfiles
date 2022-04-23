#!/bin/bash

needs locker.sh || return

sudo apt install -y scrot

clone 'https://github.com/ununhexium/hexpxl.git'

echo "cd $HOME/dev/ununhexium/hexpxl && cargo build --release && cargo install" | bash

inst_script locker.sh

