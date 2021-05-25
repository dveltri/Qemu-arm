#!/bin/bash
# -v /tmp/mount:/var/lib/postgresql/data
sudo ufw allow 80
sudo ufw allow 1234
docker run --name jlink -e SEND_HOST="localhost" jlink:latest
