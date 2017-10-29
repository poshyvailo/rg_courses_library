#!/bin/bash

DOCKER_IMAGE='poshik-library:latest'

# Обновление докер образа
if [[ $1 == 'rebuild' ]]; then
    sudo docker rmi $DOCKER_IMAGE
    cp Gemfile docker/Gemfile
    docker build -t $DOCKER_IMAGE docker
    rm docker/Gemfile
    exit 0
fi

# Удаление докер образа
if [[ $1 == 'rmi' ]]; then
    sudo docker rmi $DOCKER_IMAGE
    exit 0
fi

# Создаем новый образ, если его еще нет в системе.
if [[ "$(docker images -q $DOCKER_IMAGE 2> /dev/null)" == "" ]]; then
    cp Gemfile docker/Gemfile
    docker build -t $DOCKER_IMAGE docker
    rm docker/Gemfile
fi

if [[ -n "$1" ]]; then
    arg=$1
else
    arg='run.rb'
fi

# Запускаем образ на выполнение
docker run -it --rm -v "$PWD":/usr/src/app $DOCKER_IMAGE ruby $arg