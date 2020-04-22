# Qemu-arm
Docker for run FreeRtos with qemu-arm-cortex

### Comandos utiles
 - dbuild.sh
 - create_container.sh
 - docker run --name qemu -e SEND_HOST="localhost" qemu:latest
 - docker start qemu
 - docker stop qemu
 - dbash.sh qemu
 - arm-none-eabi-gdb -ex="target remote localhost:1234"

### Iniciar el firmware
 - qemu-system-arm -nographic -serial mon:stdio -machine lm3s811evb -kernel RTOSDemo.bin -s -S

### Debuger 
 - - arm-none-eabi-gdb -ex="target remote localhost:1234"

 ## Creditos
 - http://roboticravings.blogspot.com/2018/07/freertos-on-cortex-m3-with-qemu.html
 - https://docs.zephyrproject.org/1.10.0/boards/arm/qemu_cortex_m3/doc/board.html