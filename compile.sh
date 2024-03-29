#!/bin/bash

watch=" "

if [[ "$@" == "--watch" ]]; then
    unset watch # It's weird but it gets the job done
fi

mkdir -p target # There is some sort of bug in docker where if the folder does not exist it will reset the ownership in the container to root
docker run --rm -v $(pwd)/target:/home/tex/app/target ${watch:--v $(pwd)/src:/home/tex/app/src} modelos1-tp1 ${watch:--pvc}
