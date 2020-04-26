
FROM ubuntu:16.04
RUN apt-get update
RUN apt-get install -y -qq git
RUN apt-get install -y -qq --no-install-recommends wget mc
RUN apt-get install -y -qq --no-install-recommends nano
RUN apt-get install -y -qq tmux htop
RUN apt-get install -y gcc-arm-none-eabi binutils-arm-none-eabi gdb-arm-none-eabi openocd
RUN apt-get install -y -qq make
#--------------------------------------------
WORKDIR /
RUN git clone https://github.com/FreeRTOS/FreeRTOS.git
WORKDIR /FreeRTOS/
RUN git submodule update --init --recursive
WORKDIR /FreeRTOS/FreeRTOS/Demo/CORTEX_LM3S811_GCC
ADD standalone.ld /FreeRTOS/FreeRTOS/Demo/CORTEX_LM3S811_GCC/
RUN make
#--------------------------------------------
RUN apt-get install -y libcurl3
RUN apt-get install -y -qq qemu-system-arm
WORKDIR /FreeRTOS/FreeRTOS/Demo/CORTEX_LM3S811_GCC/gcc
#--------------------------------------------
ADD docker-entrypoint.sh /
EXPOSE 1234 80
#ENTRYPOINT ["/./docker-entrypoint.sh"]