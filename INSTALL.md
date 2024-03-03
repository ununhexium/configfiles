# Installation steps

## Github access

```sh
ssh-keygen
```

And upload the keys or use older keys.

```sh
pacman -S git git-delta
git clone '/path/to/the/cloned/repos/root'
```

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
ln -s "$REPO/.config/zsh/" "$HOME/zsh"
```

Link the resource file and folder

```sh
ln -s "$HOME/.config/zsh/.zshenv" "$HOME/.zshenv"
ln -s "$HOME/.config/zsh/.zshrc" "$HOME/.zshrc"
```

## CLI

```sh
pacman -S acpi base-devel bc broot entr git htop lynx strace stress tldr unzip zip
```

## Cargo dependencies

```sh
pacman -S rustup
rustup install stable
rustup install eza hexyl
```

## ClamAV

[Wiki](https://wiki.archlinux.org/title/ClamAV)

```sh
pacman -S clamav
systemctl enable clamav-freshclam.service --now
sudo -u clamav freshclam  # refresh the virus DB
```

## Neovim

```sh
ln -s "$REPO/nvim" "$HOME/.config/nvim"
```

## AUR

```sh
pacman -S base-devel
```

# System

Disable power button.

```sh
diff -u /etc/systemd/logind.conf "$REPO/etc/systemd/logind.conf"
```

# GUI

## Xorg

```sh
pacman -S arandr xbindkeys xdotool xorg-xev xorg-xrandr xorg-xwininfo
ln -s "$REPO/xbindkeys" "$HOME/.config/xbindkeys"
```

## General

```sh
pacman -S \
  adobe-source-code-pro-fonts \
  chromium \
  firefox \
  flameshot \
  gimp \
  noto-fonts-cjk \
  noto-fonts-emoji \
  noto-fonts \
  ttf-fira-code \
  ttf-firacode-nerd \
  ttf-sourcecodepro-nerd
```

## Battery level

Also requires dunst for the notifications

```sh
pacman -S xfce4-power-manager
```

## Scripts

```sh
pacman -S dpkg feh file glow jq mupdf unzip vlc xclip
ln -s "$REPO/local/scripts" "$HOME/.local/scripts"
```

## i3

```sh
pacman -S i3-wm i3blocks i3status i3lock numlockx
ln -s "$REPO/i3/" "$HOME/.config/i3"
ln -s "$REPO/i3blocks" "$HOME/.config/i3blocks"
```

## Alacritty

```sh
pacman -S alacritty
ln -s "$REPO/alacritty" "$HOME/.config"
```

## Touchpad

```sh
pacman -S xf86-input-synaptics xorg-xinput
```

Copy [config file](xorg/70-synaptics.conf) to `/etc/X11/xorg.conf.d/`

## Copyq

```sh
pacman -S copyq
diff -u "$REPO/copyq/copyq.conf" "$HOME/.config/copyq/copyq.conf"
```

To do: check when to copy the copyq config folder: before or after install. Does it need extra steps to preserve the config?


## Dunst

```sh
pacman -S adwaita-icon-theme dunst libnotify
ln -s "$REPO/dunst" "$HOME/.config/dunst"
"$HOME/.config/dunst/sample.sh"
```

## Network

```sh
pacman -S network-manager-applet
```

## Development

```sh
pacman -S kdiff3
```

## JVM

Get [SDKMan](https://sdkman.io/)

```sh
sdk search java ...
```

## Custom lock screen

```sh
pacman -S scrot 
clone git@github.com:ununhexium/hexpxl.git
cd "$HOME/dev/ununhexium/hexpxl"
cargo build --release
cp target/release/hexpxl "$HOME/.local/bin/hexpxl"
```

## Audio

```sh
pacman -S alsa-utils pamixer pulseaudio pulseaudio-alsa pavucontrol
```

## Graphics

```sh
pacman -S gimp
```
