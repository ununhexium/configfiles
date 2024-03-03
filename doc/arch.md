# Arch isntall

## USB Install

[official doc](https://wiki.archlinux.org/title/Installation_guide)


## At pacstrap

Get this part of the file

```sh
curl https://raw.githubusercontent.com/ununhexium/configfiles/yet-another/doc/arch.md | grep 'pacstrap /mnt' -A 10
```

Note: the branch name `yet-another` may be different.


```sh
pacstrap /mnt \
    base \
    dhcpcd \
    grub \
    linux \
    linux-firmware \
    lvm2 \
    mkinitcpio \
    man-db \
    man-pages \
    neovim \
    pacman \
    zsh \

```

## After chroot

```sh
zsh
```

## After USB install

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
