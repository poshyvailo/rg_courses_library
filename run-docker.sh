#!/bin/bash

DOCKER_IMAGE='poshik-library:latest'

create_docker_image() {
    cp Gemfile docker/Gemfile
    cp Gemfile.lock docker/Gemfile.lock
    docker build -t $DOCKER_IMAGE docker
    rm docker/Gemfile docker/Gemfile.lock
}

remove_docker_image() {
    sudo docker rmi $DOCKER_IMAGE
}

# Обновление докер образа
if [[ $1 == 'rebuild' ]]; then
    remove_docker_image
    create_docker_image
    exit 0
fi

# Удаление докер образа
if [[ $1 == 'rmi' ]]; then
    remove_docker_image
    exit 0
fi

# Создаем новый образ, если его еще нет в системе.
if [[ "$(docker images -q $DOCKER_IMAGE 2> /dev/null)" == "" ]]; then
    create_docker_image
fi

if [[ -n "$1" ]]; then
    arg=$1
else
    arg='main.rb'
fi

# Запускаем образ на выполнение
docker run -it --rm -v "$PWD":/usr/src/app $DOCKER_IMAGE ruby $arg