#!/bin/bash

# Создаем новый образ, если его еще нет в системе.
if [[ "$(docker images -q poshik-library:latest 2> /dev/null)" == "" ]]; then
    cp Gemfile docker/Gemfile
    docker build -t poshik-library:latest docker
    rm docker/Gemfile
fi

# Запускаем образ на выполнение
docker run -it --rm -v "$PWD":/usr/src/app poshik-library:latest ruby run.rb