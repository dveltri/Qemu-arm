
FROM ubuntu:16.04
RUN apt-get update
RUN apt-get install -y -qq --no-install-recommends git
RUN apt-get install -y -qq --no-install-recommends wget mc
RUN apt-get install -y -qq --no-install-recommends nano
RUN apt-get install -y gcc-arm-none-eabi binutils-arm-none-eabi gdb-arm-none-eabi openocd
RUN apt-get install -y -qq tmux htop
RUN apt-get install -y -qq make
RUN #--------------------------------------------
WORKDIR /dgv/
RUN git clone https://github.com/FreeRTOS/FreeRTOS.git --recurse-submodules
WORKDIR /dgv/FreeRTOS/
RUN git submodule update --init --recursive
WORKDIR /dgv/FreeRTOS/FreeRTOS/Demo/CORTEX_LM3S811_GCC
ADD standalone.ld /dgv/FreeRTOS/FreeRTOS/Demo/CORTEX_LM3S811_GCC/
RUN make
RUN #--------------------------------------------
RUN apt-get install -y libcurl3
RUN apt-get install -y -qq qemu-system-arm
WORKDIR /dgv/FreeRTOS/FreeRTOS/Demo/CORTEX_LM3S811_GCC/gcc
RUN ls -al
RUN #--------------------------------------------
#ADD *.bin /dgv/
ADD docker-entrypoint.sh /
EXPOSE 1234 80
ENTRYPOINT ["/./docker-entrypoint.sh"]