# Installation steps

## Get everything

Init submodules

```sh
git submodule init
git submodule update
```

Remember the repo's root

```sh
export REPO='/path/to/the/cloned/repos/root'
```

## Git

```sh
ln -s "$REPO"/git ~/.config/git
```

## Neovim

```sh
ln -s "$REPO"/nvim "$HOME"/.config/nvim
``

## Zsh

Link the config

```sh
ln -s "$REPO/.config/zsh/" ~/.config/zsh
```

Link the resource file and folder

```sh
ln -s ~/.config/zsh/.zshenv ~/.zshenv
ln -s ~/.config/zsh/.zshrc ~/.zshrc
```

```sh
zsh
```

## General

```sh
sudo pacman -S ttf-sourcecodepro-nerd
```

## Alacritty

```sh
pacman -S ttf-sourcecodepro-nerd
ln -s "$REPO/alacritty" ~/.config
```

## Touchpad

```sh
pacman -S xf86-input-synaptics
pacman -S xorg-xinput
```

Copy [config file](xorg/70-synaptics.conf) to `/etc/X11/xorg.conf.d/`

## i3

```sh
ln -s "$REPO"/i3/ "$HOME"/.config/i3
ln -s "$REPO"/i3blocks "$HOME"/.config/i3blocks
```
