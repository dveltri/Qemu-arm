
FROM ubuntu:16.04
RUN apt-get update -y
RUN apt-get install -y -qq git tmux htop wget
RUN apt-get install -y -qq --no-install-recommends mc nano unzip
RUN apt-get install -y build-essential
RUN apt-get install -y binutils
RUN apt-get install -y gdb
RUN apt-get install -y gcc-arm-none-eabi binutils-arm-none-eabi gdb-arm-none-eabi openocd
RUN apt-get install -y make
RUN apt-get install -y libcurl3
RUN apt-get install -y usbutils
#--------------------------------------------
WORKDIR /
ADD ./tools/jlinkexe.sh /
ADD JLink_Linux_V720b_x86_64.deb /
RUN dpkg -i JLink_Linux_V720b_x86_64.deb
#--------------------------------------------
# ADD docker-entrypoint.sh /
# EXPOSE 1234 80
#ENTRYPOINT ["/./docker-entrypoint.sh"]
