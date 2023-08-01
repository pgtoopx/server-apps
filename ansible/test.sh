#!/bin/bash

# Nombre de la imagen Docker
DOCKER_IMAGE_NAME="ansible-test"

# Directorio de trabajo actual
WORKING_DIRECTORY="$PWD"

# Construir la imagen Docker
echo "Construyendo la imagen Docker..."
docker build -t $DOCKER_IMAGE_NAME $WORKING_DIRECTORY

# Ejecutar el contenedor de Docker con el playbook y guardar el resultado de la ejecución
echo "Ejecutando el playbook dentro del contenedor..."
docker run -it --rm $DOCKER_IMAGE_NAME > test_result.txt 2>&1

# Verificar si las pruebas pasaron o no
if grep -q "PLAY RECAP" test_result.txt && ! grep -q "failed=0" test_result.txt; then
    echo "Las pruebas fallaron."
    exit 1
else
    echo "Las pruebas pasaron exitosamente."
    exit 0
fi
