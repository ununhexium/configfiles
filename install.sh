#!/usr/bin/env bash

sudo apt install ansible

[[ `sudo ansible-galaxy collection list | grep community.general` ]] || sudo ansible-galaxy collection install community.general

sudo ansible-galaxy install -r ./ansible/requirements.yml

sudo ansible-playbook ./ansible/main.yml

[[ $(which zsh) ]] && sudo chsh --shell "$(which zsh)" "$USER"

# Glow
# Installed here because I didn't find a way to add this apt repo with ansible
# Tried: https://docs.ansible.com/ansible/latest/collections/ansible/builtin/apt_repository_module.html

which glow
if [ ! $? ]; then
    echo 'deb [trusted=yes] https://repo.charm.sh/apt/ /' | sudo tee /etc/apt/sources.list.d/charm.list
    sudo apt update && sudo apt install glow
fi

# Refresh the binaries index
[[ $SHELL =~ '/zsh$' ]] && rehash

echo "MANUAL STEPS"

echo "Get uBlock https://www.google.com/search?q=ublock"
echo
echo "Bypass the graphical login and use the console so ZSH sources the right env (especially PATH)"
echo "sudo systemctl set-default multi-user.target"
echo "To revert and boot into the graphical display manager again"
echo "sudo systemctl set-default graphical.target"
