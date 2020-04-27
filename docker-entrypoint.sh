#!/bin/bash
set -e
echo "docker-entrypoint.sh finish" >> /tmp/logs.log
tail -f /tmp/logs.log
