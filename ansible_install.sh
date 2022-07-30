#!/usr/bin/env bash

sudo ansible-galaxy collection install community.general

sudo ansible-galaxy install -r ./ansible/requirements.yml

sudo ansible-playbook ./ansible/main.yml
