#!/bin/bash

current_path=$HOME/redes
build_id=$1
# Go to selected version
cd $current_path/docker
version_latest=$(docker images --format '{{.Repository}}:{{.Tag}}' | grep -E '^ltm/todo-app:[0-9]+$' | sort -r | awk 'NR==1' | awk -F: '{print $2}')
version=$(docker images --format '{{.Repository}}:{{.Tag}}' | grep -E '^ltm/todo-app:[0-9]+$' | sort -r | awk 'NR==2' | awk -F: '{print $2}')
echo $version

BUILD_ID=$docversion_latest docker-compose down 
BUILD_ID=$version docker-compose up -d
#docker image rm todo
#docker build . -t "ltm/todo-app:${build_id}"
#docker-compose up -d -e PORT=8010 BUILD_ID=$build_id
