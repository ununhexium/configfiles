
## After USB install

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

### System time sync

Having the wrong system time leads to various authentication issues

https://wiki.archlinux.org/title/systemd-timesyncd

