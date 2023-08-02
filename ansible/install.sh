#!/bin/bash

# Instalar paquetes necesarios
sudo apt update
sudo apt install -y software-properties-common

# Instalar Ansible
sudo apt-add-repository --yes --update ppa:ansible/ansible
sudo apt install -y ansible

curl -fsSL https://raw.githubusercontent.com/pgtoopx/server-apps/main/ansible/playbook.yaml | ansible-playbook -i "localhost," -c local -

