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

```sh
pacman -S zsh
```

Link the config

```sh
ln -s "$REPO/zsh/" "$HOME/.config/zsh"
```

Link the resource file and folder

```sh
ln -s "$HOME/.config/zsh/.zshenv" "$HOME/.zshenv"
ln -s "$HOME/.config/zsh/.zshrc" "$HOME/.zshrc"
```

Start zsh and check that it's workable. Then change the login shell.

```sh
chsh -s `which zsh` uuh
```

## CLI

```sh
sudo `cat INSTALL.md | head -n LINE | tail -n SIZE`
pacman -S bat broot entr fzf git inetutils lynx neovim tldr unzip zip
```

## Broot

```sh
broot --install
```

## Cargo dependencies

```sh
pacman -S rustup
rustup install stable
cargo install eza hexyl
```

## Neovim

```sh
ln -s "$REPO/nvim" "$HOME/.config/nvim"
```


# GUI

## Xorg

```sh
pacman -S arandr xbindkeys xdotool xorg-xev xorg-xrandr xorg-xset xorg-xwininfo
ln -s "$REPO/xbindkeys" "$HOME/.config/xbindkeys"
```

## i3

```sh
pacman -S i3-wm i3blocks i3status i3lock numlockx rofi
# backup current i3 config
mv "$HOME/.config/i3" "$HOME/.config/i3_bkp"
ln -s "$REPO/i3" "$HOME/.config/i3"
ln -s "$REPO/i3blocks" "$HOME/.config/i3blocks"
```


## General

```sh
pacman -S \
  chromium \
  firefox \
  flameshot \
  kdiff3 \
  man-db \
  network-manager-applet \
  noto-fonts-cjk \
  noto-fonts-emoji \
  noto-fonts \
  ttf-fira-code \
  ttf-firacode-nerd \
  xorg-xsetroot \
```

## Alacritty

```sh
pacman -S alacritty
ln -s "$REPO/alacritty" "$HOME/.config"
```

## Start X

Xorg+i3 should now be running ok

## Scripts

```sh
pacman -S dpkg feh file glow jq mupdf unzip vlc xclip
ln -s "$REPO/local/scripts" "$HOME/.local/scripts"
```

## Touchpad

```sh
pacman -S xf86-input-synaptics xorg-xinput
```

Copy [config file](xorg/70-synaptics.conf) to `/etc/X11/xorg.conf.d/`

## Copyq

```sh
pacman -S copyq
```

Start and stop copyq to generate a default config file.

```sh
diff --color -u "$REPO/copyq/copyq.conf" "$HOME/.config/copyq/copyq.conf"
cp "$REPO/copyq/copyq.conf" "$HOME/.config/copyq/copyq.conf"
```


## Dunst

```sh
pacman -S adwaita-icon-theme dunst libnotify
ln -s "$REPO/dunst" "$HOME/.config/dunst"
"$HOME/.config/dunst/sample.sh"
```

Reboot

## Network

```sh
pacman -S network-manager-applet
```

## JVM

Get [SDKMan](https://sdkman.io/)

```sh
sdk search java ...
```

Install the latest requirements.

```sh
sdk install ant;
sdk install gradle;
sdk install groovy;
sdk install java;
sdk install ki;
sdk install kotlin;
sdk install kscript;
sdk install maven;
sdk install quarkus;
sdk install scala;
sdk install visualvm;
```

## Idea

Get and download IntelliJ

[https://www.jetbrains.com/idea/download/](https://www.jetbrains.com/idea/download/)

## Custom lock screen

```sh
pacman -S scrot 
clone git@github.com:ununhexium/hexpxl.git
cd "$HOME/dev/ununhexium/hexpxl"
cargo build --release
mkdir -p "$HOME/.local/bin"
cp target/release/hexpxl "$HOME/.local/bin/hexpxl"
```

## Audio

```sh
pacman -S alsa-utils pamixer pulseaudio pulseaudio-alsa pavucontrol
```

## Development

```sh
pacman -S kdiff3
```

## Graphics

```sh
pacman -S gimp
```

## Screen

```sh
pacman -S geoclue redshift
```

Try it
/usr/lib/geoclue-2.0/demos/where-am-i

# Extra

## More CLI

```sh
pacman -S 7zip acpi base-devel bc bind btop htop inetutils lynx strace stress tldr unzip zip
```

# System

## Disable power button.

```sh
diff --color -u /etc/systemd/logind.conf "$REPO/etc/systemd/logind.conf"
```

## Battery level

Also requires dunst for the notifications

```sh
pacman -S xfce4-power-manager
```

## Energy saving and battery care

```sh
pacman -S tlp
```

or

```sh
pacman -S tuned
```

Check the config

```sh
diff -u "$REPO/tlp/tlp.conf" /etc/tlp.conf
```

Then start tlp and check the status

```sh
systemctl enable --now tlp
sudo tlp start
tlp-stat -b
```

## Monitoring

```sh
pacman -S netdata
systemctl enable --now netdata
```

## ClamAV

[Wiki](https://wiki.archlinux.org/title/ClamAV)

```sh
pacman -S clamav
systemctl enable clamav-freshclam.service --now
sudo -u clamav freshclam  # refresh the virus DB
```

