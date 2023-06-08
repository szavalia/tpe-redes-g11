#!/bin/bash
current_path=$HOME/redes

build_id=$1
cd $current_path/docker
BUILD_ID=$build_id docker-compose -p up -d 

