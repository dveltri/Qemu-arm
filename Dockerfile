
FROM ubuntu:16.04
RUN apt-get update -y
RUN apt-get install -y -qq git tmux htop wget
RUN apt-get install -y -qq --no-install-recommends mc nano unzip
RUN apt-get install -y build-essential
RUN apt-get install -y binutils
RUN apt-get install -y gdb
RUN apt-get install -y gcc-arm-none-eabi binutils-arm-none-eabi gdb-arm-none-eabi openocd
RUN apt-get install -y make
#RUN apt-get install -y scons
RUN apt-get install -y libcurl3
#--------------------------------------------
WORKDIR /
ADD ./tools/jlinkexe.sh /
RUN wget https://www.segger.com/downloads/jlink/JLink_Linux_x86_64.deb
RUN dpkg -i /home/JLink_Linux_V647f_x86_64.deb
#--------------------------------------------
ADD docker-entrypoint.sh /
EXPOSE 1234 80
#ENTRYPOINT ["/./docker-entrypoint.sh"]
