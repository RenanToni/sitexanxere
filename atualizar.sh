#!/bin/bash

# Caminho do diretório do projeto
PROJECT_DIR="/home/novo_usuario/sitexanxere/"

# Nome do contêiner
CONTAINER_NAME="my-django-app"

# Vá para o diretório do projeto
cd $PROJECT_DIR

# Faça um git pull para atualizar o repositório
git pull

# Verifique se o contêiner está em execução
if [ $(docker ps -q -f name=$CONTAINER_NAME) ]; then
    # Pare o contêiner em execução
    docker stop $CONTAINER_NAME
    # Remova o contêiner
    docker rm $CONTAINER_NAME
fi

# Construa a nova imagem Docker
docker build -t $CONTAINER_NAME .

# Inicie o contêiner com a nova imagem
docker run -d -p 8000:8000 --name $CONTAINER_NAME $CONTAINER_NAME
