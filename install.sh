#!/bin/bash

SCRIPT=$(readlink -f "$0")
export DIR=$(dirname "$SCRIPT")
export SCRIPT_DIR="$HOME/.local/scripts/"

export PATH="$PATH:$HOME/.local/bin:$HOME/.local/scripts"

function cecho() {
    "$DIR/.local/scripts/cecho" $*
}

if [ $# -eq 0 ]; then
    echo "The available customizations are: "
    ls -1 "$DIR/setup.d/"

    echo "Install something with install.sh <some package>"

    exit 1
fi

cecho green "Installing $*"

mark=$(date "+%Y-%m-%dT%H:%M:%S")
bkpdir="$HOME/.backup/setup/$mark"
echo -n "$mark" > "$HOME/.backup/setup/.lastmark"

if [ ! -e "$bkpdir" ]; then
	mkdir -p "$bkpdir"
fi

DONEDIR="$HOME/.backup/setup/done/"
if [ ! -e "$DONEDIR" ]; then
    mkdir "$DONEDIR"
fi

function backup() {
    name="$(echo $1 | sed -e 's#/#_#g')"
    archive="$bkpdir/$name"
    if [ -e $1 ]; then
        echo "Archiving $1 to $archive"
        mv "$1" "$archive"
    fi
}

# Backup and Link
function bnl() {
    dst="$HOME/$1"
    src="$DIR/$1"
    if [ -e "$DIR/$1" ]; then
        if [ -L "$dst" -a $(readlink -f "$dst") = "$src" ]; then
            echo "Skip replacement of $dst, it is already the right target"
        else
            if [ -e $1 ]; then
                echo "Backup $1 to $dst"
                backup "$dst"
                echo "Linking $src to $dst"
                ln -s "$src" "$dst"
            fi
        fi
    fi
}

# Backup and link scripts
function inst_script() {
    if [ ! -d "$HOME/.local/scripts" ]; then
        mkdir "$HOME/.local/scripts"
    fi

    t="$HOME/.local/scripts/$1"
    if [ -e "$t" ]; then
        cecho yellow "$t already exists. Skipping"
    else
        ln -s "$DIR/.local/scripts/$1" "$HOME/.local/scripts/$1"
    fi
}

# install script header
function needs() {
    if [ -e "$SCRIPT_DIR/$1" ]; then
        cecho yellow "$1 is already installed"
        return 1
    else
        return 0
    fi
}

# prepare target script folder
if [ ! -e "$SCRIPT_DIR" ]; then
    mkdir "$SCRIPT_DIR"
fi

bnl .config/dunst
bnl .config/i3
bnl .config/i3blocks
bnl .config/rofi
bnl .gitconfig
bnl .gitignore
bnl .resources
bnl .vimrc
bnl .zshrc
bnl .zshrc.user


function inst() {
    source "$DIR/setup.d/$1"
}

echo "Base config"
for file in $*; do
    inst "$file"
    #echo
    #echo "############################################################"
    #[[ ! -e "$DONEDIR/$file" ]] && source "$DIR/setup.d/$file" && touch "$DONEDIR/$file"
    #echo "############################################################"
    #echo

done

