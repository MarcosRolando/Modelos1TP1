#!/bin/sh

mkdir -p target # There is some sort of bug in docker where if the folder does not exist it will reset the ownership in the container to root
docker run --rm -u $(id -u):$(id -g) -v $(pwd)/target:/home/compiler/app/target modelos1-tp1
