REPO_PATH=$(git rev-parse --show-toplevel)

echo $REPO_PATH
if [[ $(docker ps -a | grep posix) ]]; then
echo "existe el container"
if [[ $(docker ps | grep posix) ]]; then
echo "esta corriendo"
else
docker start posix
fi
echo "Entring to bash of posix"
docker exec -it posix tmux new -s dgv
echo "stoping posix"
docker stop posix
else
echo "creating and run container posix"
docker run --name posix -v ${REPO_PATH}:${PWD} -i -w / -t posix:latest
fi
