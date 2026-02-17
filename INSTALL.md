# Installation steps

## Bigger font

```sh
sudo pacman -S terminus-font
setfont ter-132n  # ter-1<size><>
```


## Github access

```sh
sudo pacman -S openssh
ssh-keygen
```

And upload the keys or use older keys.

```sh
sudo pacman -S git git-delta
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
sudo pacman -S zsh
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
sudo pacman -S bat broot entr fzf git inetutils lynx neovim tldr unzip zip
```

## Broot

```sh
broot --install
```

## Cargo dependencies

```sh
sudo pacman -S gcc rustup
rustup install stable
cargo install cprintf eza fd-find gradient hexyl
```

## Neovim

```sh
sudo pacman -S luarocks
ln -s "$REPO/nvim" "$HOME/.config/nvim"
```


# GUI

## Xorg

```sh
sudo pacman -S arandr xbindkeys xdotool xorg-apps xorg-server xorg-xev xorg-xinit xorg-xrandr xorg-xset xorg-xwininfo
ln -s "$REPO/xbindkeys" "$HOME/.config/xbindkeys"
```

## i3, alacritty and other basic GUI requirements

```sh
sudo pacman -S alacritty copyq i3-wm i3blocks i3status i3lock numlockx rofi
# backup current i3 config
mv "$HOME/.config/i3" "$HOME/.config/i3_bkp"
ln -s "$REPO/i3" "$HOME/.config/i3"
ln -s "$REPO/i3blocks" "$HOME/.config/i3blocks"
ln -s "$REPO/alacritty" "$HOME/.config"
```


## General

```sh
sudo pacman -S \
  baobab \
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

## Start X

Xorg+i3 should now be running ok

## Scripts

```sh
sudo pacman -S bc dpkg feh file glow jq mupdf unzip vlc xclip
ln -s "$REPO/local/scripts" "$HOME/.local/scripts"
```

## Touchpad

```sh
sudo pacman -S xf86-input-synaptics xorg-xinput
```

Copy [config file](xorg/70-synaptics.conf) to `/etc/X11/xorg.conf.d/`

## Copyq

```sh
sudo pacman -S copyq
```

Start and stop copyq to generate a default config file.

```sh
diff --color -u "$REPO/copyq/copyq.conf" "$HOME/.config/copyq/copyq.conf"
cp "$REPO/copyq/copyq.conf" "$HOME/.config/copyq/copyq.conf"
```


## Dunst

```sh
sudo pacman -S adwaita-icon-theme dunst libnotify
ln -s "$REPO/dunst" "$HOME/.config/dunst"
"$HOME/.config/dunst/sample.sh"
```

Reboot

## Network

```sh
sudo pacman -S network-manager-applet
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
sudo pacman -S scrot 
clone git@github.com:ununhexium/hexpxl.git
cd "$HOME/dev/ununhexium/hexpxl"
cargo build --release
mkdir -p "$HOME/.local/bin"
cp target/release/hexpxl "$HOME/.local/bin/hexpxl"
```

## Audio

```sh
sudo pacman -S alsa-utils pamixer pulseaudio pulseaudio-alsa pavucontrol
```

## Development

```sh
sudo pacman -S kdiff3
```

## Graphics

```sh
sudo pacman -S gimp mesa-utils
```

## Screen

```sh
sudo pacman -S geoclue redshift
```

Try it
/usr/lib/geoclue-2.0/demos/where-am-i

# Extra

## More CLI

```sh
sudo pacman -S 7zip acpi base-devel bc bind btop htop inetutils lynx python-pipx strace stress tldr tree unzip usbutils zip
```

## More python

```sh
pipx install rich-cli
pipx install ipython
```

# System

## Disable power button.

Set `HandlePowerKey=ignore`.

```sh
diff --color -u /etc/systemd/logind.conf "$REPO/etc/systemd/logind.conf"
```

## Battery level

Also requires dunst for the notifications

```sh
sudo pacman -S xfce4-power-manager
```

## Energy saving and battery care

```sh
sudo pacman -S tlp
```

or

```sh
sudo pacman -S tuned
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
sudo pacman -S netdata
systemctl enable --now netdata
```

## ClamAV

[Wiki](https://wiki.archlinux.org/title/ClamAV)

```sh
sudo pacman -S clamav
systemctl enable clamav-freshclam.service --now
sudo -u clamav freshclam  # refresh the virus DB
```

## Keyring

```sh
sudo pacman -S gnome-keyring libsecret polkit-gnome seahorse
```

If loging without a session manager, add those 2 lines in /etc/pam.d/login

```sh
diff -u --color /etc/pam.d/login "$REPO/etc/pam.d/login"
```

The following line must be present and enabled in `~/.config/i3/config`

```
exec --no-startup-id /usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1
```

## Disabled PC speaker

Blacklist the `pcspkr` module

```sh
cp "$REPO/etc/modprobe.d/nobeep.conf" '/etc/modprobe.d/nobeep.conf'
```

## SSH Agent

Enable the ssh socket

```sh
systemctl --user enable ssh-agent.socket
```

Add SSH config

```sh
diff -u ~/.ssh/config "$REPO/ssh/config"
```

## Fixed Braille

With font [patcher 3.5+](https://github.com/ryanoasis/nerd-fonts)

```sh
sudo pacman -S fontforge
mkdir ~/dev/ryanoasis
git clone --depth=1 https://github.com/ryanoasis/nerd-fonts ~/dev/ryanoasis/nerd-font
cd ~/dev/ryanoasis/nerd-font
for size in 'Regular' 'Bold' 'Medium'; do
    ./font-patcher \
        --name "Furi Code ${size}" \
        --outputdir ~/.local/share/fonts/ \
        --mono \
        --braille=gapless \
        --complete \
        --adjust-line-height /usr/share/fonts/TTF/FiraCode-${size}.ttf;
done
```

## Emoji

```sh
sudo pacman -S rofi-emoji
```

## Fix firefox tab font size

https://www.reddit.com/r/firefox/comments/qlryb6/hello_can_i_change_font_size_of_tab_its_so_tiny/

