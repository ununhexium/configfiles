#!/bin/bash

SCRIPT=$(readlink -f "$0")
SCRIPTPATH=$(dirname "$SCRIPT")
echo $SCRIPTPATH

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
	if [ -e "$1" ]; then 
		backup "$dst"
	else
		rm "$dst"
	fi

	echo "Linking $src to $dst"
	ln -s "$src" "$dst"
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

