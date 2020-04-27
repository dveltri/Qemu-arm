
FROM ubuntu:16.04
RUN apt-get update -y
RUN apt-get install -y -qq git tmux htop
RUN apt-get install -y -qq --no-install-recommends wget mc nano unzip
RUN apt-get install -y build-essential
RUN apt-get install -y binutils
RUN apt-get install -y gdb
#RUN apt-get install -y gcc-arm-none-eabi binutils-arm-none-eabi gdb-arm-none-eabi openocd
RUN apt-get install -y make
RUN apt-get install -y scons
#RUN apt-get install -y libcurl3
#--------------------------------------------
WORKDIR /
RUN git clone https://github.com/FreeRTOS/FreeRTOS.git
WORKDIR /FreeRTOS/
RUN git submodule update --init --recursive
WORKDIR /FreeRTOS/FreeRTOS/Source
RUN git checkout master && git pull
WORKDIR /FreeRTOS/FreeRTOS/Demo/Posix_GCC/
RUN scons --simple --coverage
#--------------------------------------------
WORKDIR /
RUN wget http://interactive.freertos.org/attachments/token/r6d5gt3998niuc4/?name=Posix_GCC_Simulator_6.0.4.zip
RUN unzip *.zip -d .
RUN rm *.zip
WORKDIR /Posix_GCC_Simulator/FreeRTOS_Posix/Debug
ADD makefile /Posix_GCC_Simulator/FreeRTOS_Posix/Debug/
RUN make
#--------------------------------------------
ADD docker-entrypoint.sh /
EXPOSE 1234 80
#ENTRYPOINT ["/./docker-entrypoint.sh"]
