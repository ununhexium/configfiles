export ZDOTDIR=~/.config/zsh

# XDG
export XDG_CONFIG_HOME=~/.config
export XDG_CACHE_HOME=~/.cache
export XDG_DATA_HOME=~/.local/share
export XDG_STATE_HOME=~/.local/state
export XDG_RUNTIME_DIR=~/.xdg

# Custom
export DOTFILES=$XDG_CONFIG_HOME/dotfiles
export GNUPGHOME=$XDG_DATA_HOME/gnupg
export REPO_HOME=$XDG_CACHE_HOME/repos
export ANTIDOTE_HOME=$REPO_HOME

# Ensure path arrays do not contain duplicates.
typeset -gU fpath path cdpath

# PAGER
export PAGER=less

# Regional settings
export LANG='en_US.UTF-8'


