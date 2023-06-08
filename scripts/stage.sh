#!/bin/bash
current_path=$HOME/redes

build_id=$1


cd $current_path

docker build --build-arg BUILD_ID=$build_id . -t "ltm/todo-app:${build_id}" 

# Build latest release
cd $current_path/docker

BUILD_ID=$build_id docker-compose -p "todo-app-stage" -f "docker-compose-stage.yml" up -d

