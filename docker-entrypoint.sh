#!/bin/bash
set -e
echo "docker-entrypoint.sh finish" >> /tmp/logs.log
echo "qemu-system-arm -nographic -serial mon:stdio -machine lm3s811evb -kernel RTOSDemo.bin -s -S" >> /tmp/logs.log
#qemu-system-arm -nographic -machine lm3s811evb -kernel gcc/RTOSDemo.bin -s -S
tail -f /tmp/logs.log
