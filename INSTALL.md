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
ln -s "$REPO/alacritty" ~/.config
```

## Touchpad

```sh
pacman -S xf86-input-synaptics
pacman -S xorg-xinput
```

Copy [config file](xorg/70-synaptics.conf) to `/etc/X11/xorg.conf.d/`

