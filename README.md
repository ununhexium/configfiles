# `.files`

My personal config files with a setup script.

The theme is 8-bit style making good use of 4k screens: now shows up to 25 pixels per pixel 🙃.

## Quick install

git clone 'https://github.com/ununhexium/configfiles.git' && cd configfiles && ./setup.sh

## Content

### `setup.sh`

Moves the existing files, put them in `~/.backup` and replace them with my opinionated preferences.

### `.config/`

Dunst, i3, i3blocks and rofi themes.

### `.gitconfig`

My git shortcuts

### `aptinstall`

Combines `apt` with `fzf` to have a quick search tool with package description. No more off by 1 char mistake in `apt install`. No more listing totally irrelevant packages names just because a keyword is in the package's description.

### `c`

A coomand to show any kind of file the the colors/editor I like.

### `cecho`

`echo` with basic color support

### `clone`

Clone git repos to their appropriate place

### `i3background`

Uses an animated gif as an i3 backgroud

### `i3emoji`

Emoji picker via rofi

### `i3menu`

Menu for custom i3 commands

### `i3nerdfont`

Nerd font select via rofi

### `i3paste`

Access the clipboard history, using clipster daemon, via rofi

### `javaversion`

Tells the version of the class files inside a jar.

### `newscript`

Creates a new scripts in the right folder, with executable rights.

### `pasto`

Paste the current clipboard content to a file

### `rGit`

Execute git commands recursively in all subfolders which contain a `.git` folder

### `trash`

Moves files to a trash folder instead of deleting them

### `wvi`

Equivalent to `vi $(which scriptname))`



## TODOs

### cargo install --skip

https://github.com/rust-lang/cargo/issues/6813

### Clipster

Install clipter automatically

### Tmpfs Setup

make /mnt/tmpfs a ramdisk

