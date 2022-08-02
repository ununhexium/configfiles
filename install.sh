#!/usr/bin/env bash

sudo apt install ansible

[[ `sudo ansible-galaxy collection list | grep community.general` ]] || sudo ansible-galaxy collection install community.general

sudo ansible-galaxy install -r ./ansible/requirements.yml

sudo ansible-playbook ./ansible/main.yml

[[ $(which zsh) ]] && sudo chsh --shell "$(which zsh)" "$USER"


# Refresh the binaries index
[[ $SHELL =~ '/zsh$' ]] && rehash
