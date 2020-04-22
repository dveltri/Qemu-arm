# -v /tmp/mount:/var/lib/postgresql/data
sudo ufw allow 80
sudo ufw allow 1234
docker run --name qemu -e SEND_HOST="localhost" qemu:latest
