#!/bin/bash
REPO_PATH=$(git rev-parse --show-toplevel)

echo $REPO_PATH
if [[ $(docker ps -a | grep jlink) ]]; then
echo "existe el container"
if [[ $(docker ps | grep jlink) ]]; then
echo "esta corriendo"
else
docker start jlink
fi
echo "Entring to bash of jlink"
docker exec -it jlink tmux new -s dgv
echo "stoping jlink"
docker stop jlink
else
echo "creating and run container jlink"
#docker run --name jlink -v ${REPO_PATH}:${PWD} -i -w / -t jlink:latest
docker run --name jlink --privileged -v /dev/bus/usb/:/dev/bus/usb -i -w / -t jlink:latest
fi
