#!/bin/bash
set -e
echo "JLinkExe"
/opt/SEGGER/JLink/JLinkExe -autoconnect 1 -device Cortex-m7 -if swd -speed 4000