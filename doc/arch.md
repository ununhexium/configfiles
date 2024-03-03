# Arch install

Setup with
* full disk encryption
* Encrypted boot with LUKS1
* Encrypted LVM with LUKS2

## USB Install

[official doc](https://wiki.archlinux.org/title/Installation_guide)
[full encryption](https://gist.github.com/huntrar/e42aee630bee3295b2c671d098c81268) shortcut

TODO: partitioning

## At pacstrap

Get this part of the file

```sh
curl https://raw.githubusercontent.com/ununhexium/configfiles/yet-another/doc/arch.md | grep 'pacstrap' -A 15
```

Note: the branch name `yet-another` may be different.


```sh
#MARKER1
pacstrap /mnt \
    base \
    dhcpcd \
    efibootmgr \
    fzf \
    grub \
    linux \
    linux-firmware \
    lvm2 \
    lynx \
    mkinitcpio \
    man-db \
    man-pages \
    networkmanager \
    neovim \
    pacman \
    sudo \
    tmux \
    which \
    zsh \

```

## After chroot

```sh
zsh
alias vi=nvim
```

## Crypttab

```sh
vi /etc/crypttab
```

Add line

```
boot /dev/nvme0n1p3 /root/secrets/crypto_keyfile.bin
```

## Network

[stacks](https://wiki.archlinux.org/title/Network_configuration#Network_managers)

[wifi for noobs](https://wiki.archlinux.org/title/NetworkManager)

## After USB install


## Create regular user

adduser --groups audio,video --create-home --shell /usr/bin/zsh USER
passwd USER
EDITOR=nvim visudo
add USER to sudoers

## Wifi

```sh
nmtui
```

Activate connection > Select some wifi

## Time sync

```sh
systemctl enable --now systemd-timesyncd.service
```

### Install backup kernel in case something goes terribly wrong

```sh
pacman -S linux-lts
```

Select menu entry[1] > menu entry[2] (regular linux) as default

```sh
vi /etc/default/grub
```

`GRUB_DEFAULT=saved`


Regen the menu

```sh
grub-mkconfig -o /boot/grub/grub.cfg
```

### Check for updates

```sh
pacman -Syy
pacman -Qu
```

Install updates

```sh
pacman -Su
```

### System time sync

Having the wrong system time leads to various authentication issues

https://wiki.archlinux.org/title/systemd-timesyncd

###

For `hostname` command

```sh
pacman -S inetutils
```
