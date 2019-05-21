#!/bin/bash

SCRIPT=$(readlink -f "$0")
SCRIPTPATH=$(dirname "$SCRIPT")
echo $SCRIPTPATH

echo "Installing system dependencies"
sudo apt install \
    dunst \
    entr \
    python3 \
    python3-pip \
    rofi \
    zsh


echo "Installing python dependencies"
pip install pipsi


function pipsii() {
    python3=$(which python3)
    for var in "$@"; do
        pipsi install --python "$python3" "$var"
    done
}

pipsii \
    thefuck

function cargoi() {
    for var in "$@"; do
        cargo install --list | grep "$var" || cargo install "$var"
    done
}


echo "Installing rust dependencies"
cargoi \
    fd-find \
    lsd \
    ripgrep


mark=$(date "+%Y-%m-%dT%H:%M:%S")
bkpdir="$HOME/.backup/setup/$mark"

if [ ! -e "$bkpdir" ]; then
	mkdir -p "$bkpdir"
fi


function backup() {
	name="$(echo $1 | sed -e 's#/#_#g')"
	archive="$bkpdir/$name"
	echo "Moving $1 to $archive"
	mv "$1" "$archive"
}

# Backup and Link
function bnl() {
	dst="$HOME/$1"
	src="$SCRIPTPATH/$1"
	if [ -e "$SCRIPTPATH/$1" ]; then
        if [ -L "$dst" -a $(readlink -f "$dst") = "$src" ]; then
            echo "Skip replacement of $dst, it is already the right target"
        else
            echo "Backup $1 to $dst"
		    backup "$dst"
	        echo "Linking $src to $dst"
	        ln -s "$src" "$dst"
        fi
	fi

}


bnl .config/clipster.ini
bnl .config/dunst
bnl .config/i3
bnl .config/i3blocks
bnl .config/rofi
bnl .gitconfig
bnl .gitignore
bnl .local/scripts
bnl .resources
bnl .vimrc
bnl .zshrc
bnl .zshrc.user

