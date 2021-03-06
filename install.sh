#!/bin/bash

SCRIPT=$(readlink -f "$0")
SCRIPTPATH=$(dirname "$SCRIPT")
echo $SCRIPTPATH

export PATH="$PATH:$HOME/.local/bin:$HOME/.local/scripts"

mark=$(date "+%Y-%m-%dT%H:%M:%S")
bkpdir="$HOME/.backup/setup/$mark"
echo -n "$mark" > "$HOME/.backup/setup/.lastmark"

if [ ! -e "$bkpdir" ]; then
	mkdir -p "$bkpdir"
fi

DONEDIR="$HOME/.backup/setup/done/"
mkdir "$DONEDIR"


source "$SCRIPTPATH/setup.d/core.sh"

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


echo "Base config"
for file in $(ls "$SCRIPTPATH/setup.d" | sort -n); do
    echo
    echo "############################################################"
    [[ ! -e "$DONEDIR/$file" ]] && source "$SCRIPTPATH/setup.d/$file" && touch "$DONEDIR/$file"
    echo "############################################################"
    echo
done

