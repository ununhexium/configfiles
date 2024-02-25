# Installation steps

## Get everything

Init submodules

```bash
git submodule init
git submodule update
```

Remember the repo's root

```sh
export REPO='/path/to/the/cloned/repos/root'
```

## Git

```sh
ln -s "$REPO/git" "$HOME/.config/git"
```

# TUI

## Zsh

Link the config

```sh
ln -s "$REPO/.config/zsh/" "$HOME/.config/zsh"
```

Link the resource file and folder

```sh
ln -s "$HOME/.config/zsh/.zshenv" "$HOME/.zshenv"
ln -s "$HOME/.config/zsh/.zshrc" "$HOME/.zshrc"
```

## Scripts

```sh
pacman -S dpkg feh file glow jq mupdf unzip vlc
ln -s "$REPO/local/scripts" "$HOME/.local/scripts"
```

## Neovim

```sh
ln -s "$REPO/nvim" "$HOME/.config/nvim"
```

## JVM

Get [SDKMan](https://sdkman.io/)

# GUI

## General

```sh
pacman -S ttf-fira-code ttf-firacode-nerd adobe-source-code-pro-fonts ttf-sourcecodepro-nerd
```

## Alacritty

```sh
pacman -S alacritty
ln -s "$REPO/alacritty" "$HOME/.config"
```

## Touchpad

```sh
pacman -S xf86-input-synaptics
pacman -S xorg-xinput
```

Copy [config file](xorg/70-synaptics.conf) to `/etc/X11/xorg.conf.d/`

## i3

```sh
pacman -S i3-wm i3blocks i3status i3lock
ln -s "$REPO/i3/" "$HOME/.config/i3"
ln -s "$REPO/i3blocks" "$HOME/.config/i3blocks"
```

### Custom lock screen


```sh
pacman -S scrot 
clone git@github.com:ununhexium/hexpxl.git
cd "$HOME/dev/ununhexium/hexpxl"
cargo build --release
cp target/release/hexpxl "$HOME/"
```

