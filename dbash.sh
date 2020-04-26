REPO_PATH=$(git rev-parse --show-toplevel)
echo "Entring to bash of" $1
#docker exec -it $1 bash
docker run --name qemu -v ${REPO_PATH}:${PWD} -i -w $PWD -t qemu:latest
