#!/usr/bin/env bash

sudo ansible-galaxy install -r ./ansible/requirements.yml

sudo ansible-playbook --tags essentials ./ansible/main.yml

zsh


