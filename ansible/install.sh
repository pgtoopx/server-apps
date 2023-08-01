#!/bin/bash

# Instalar paquetes necesarios
sudo apt update
sudo apt install -y software-properties-common

# Instalar Ansible
sudo apt-add-repository --yes --update ppa:ansible/ansible
sudo apt install -y ansible

# Descargar el playbook de Ansible
# curl -O https://ruta_del_archivo/playbook.yml

# Ejecutar el playbook de Ansible
ansible-playbook -i "localhost," -c local playbook.yml
