# Usar la imagen base de Ubuntu
FROM ubuntu:latest

# Instalar paquetes necesarios para Ansible
RUN apt-get update && apt-get install -y software-properties-common

# Instalar Ansible
RUN apt-add-repository --yes --update ppa:ansible/ansible && apt-get install -y ansible

# Copiar el playbook al contenedor
COPY playbook.yml /playbook.yml

# Establecer el directorio de trabajo
WORKDIR /

# Ejecutar el playbook en el contenedor al iniciar
CMD ["ansible-playbook", "-i", "localhost,", "playbook.yml"]
