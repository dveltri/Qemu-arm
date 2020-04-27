# -v /tmp/mount:/var/lib/postgresql/data
sudo ufw allow 80
sudo ufw allow 1234
docker run --name posix -e SEND_HOST="localhost" posix:latest
