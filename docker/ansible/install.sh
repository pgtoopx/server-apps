#!/bin/sh

# Función para mostrar el log de error en caso de falla
show_error_log() {
    if [ -s "error_log.txt" ]; then
        echo "Se encontraron errores durante la instalación. Aquí está el log de errores:"
        cat error_log.txt
        exit 1
    fi
}

# Verificar si Ansible está instalado
if ! command -v ansible >/dev/null 2>&1; then
    # Instalar paquetes necesarios
    echo "Ejecutando: sudo apt update"
    sudo apt update >/dev/null
    echo "Ejecutando: sudo apt install -y software-properties-common"
    sudo apt install -y software-properties-common >/dev/null

    # Instalar Ansible
    echo "Ejecutando: sudo apt-add-repository --yes --update ppa:ansible/ansible"
    sudo apt-add-repository --yes --update ppa:ansible/ansible >/dev/null
    echo "Ejecutando: sudo apt install -y ansible"
    sudo apt install -y ansible > "error_log.txt" 2>&1

    show_error_log
fi

# Ejecutar el playbook de Ansible
echo "Ejecutando el playbook de Ansible..."
curl -fsSL https://raw.githubusercontent.com/pgtoopx/server-apps/main/ansible/playbook.yaml | ansible-playbook -i "localhost," -c local -
