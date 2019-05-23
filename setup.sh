#!/bin/bash

SCRIPT=$(readlink -f "$0")
SCRIPTPATH=$(dirname "$SCRIPT")
echo $SCRIPTPATH

echo "Adding third party repos"
wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | sudo apt-key add -
wget -q https://www.virtualbox.org/download/oracle_vbox.asc -O- | sudo apt-key add -
sudo add-apt-repository "deb http://download.virtualbox.org/virtualbox/debian bionic contrib"

sudo apt update

echo "Installing system dependencies"
sudo apt install -y \
    curl \
    dunst \
    entr \
    glances \
    gource \
    htop \
    python3 \
    python3-pip \
    rofi \
    tree \
    vim-gui-common \
    vim-runtime \
    virtualbox-6.0 \
    zsh

echo "Install vim dependencies"
mkdir -p ~/.vim/autoload ~/.vim/bundle && \
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim


echo "Installing python dependencies"
pip install --python $(which python3) pipsi


function pipsii() {
    python3=$(which python3)
    for var in "$@"; do
        pipsi install --python "$python3" "$var"
    done
}

pipsii \
    thefuck \
    tldr

function cargoi() {
    for var in "$@"; do
        cargo install --list | grep "$var" || cargo install "$var"
    done
}

echo "Installing rust dependencies"
command cargo || curl https://sh.rustup.rs -sSf | sh

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

