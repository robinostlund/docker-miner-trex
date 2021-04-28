#FROM ubuntu:18.04
FROM nvidia/cuda:11.2.0-base-ubuntu18.04

LABEL Robin Ostlund <me@robinostlund.name>

ENV ALGO=ethash
ENV SERVER=stratum+tcp://eu1.ethermine.org:4444
ENV USERNAME=0xD0469ac9d8935EBffb706EDc9D45a9c522d04f13
ENV PASSWORD=x
ENV WORKER_NAME=githubworker

# WORKDIR /root

# install packages
RUN apt update
RUN apt -y install wget 

# fetch t-rex and unpack it
RUN wget -q https://github.com/trexminer/T-Rex/releases/download/0.20.3/t-rex-0.20.3-linux.tar.gz \
    && tar -zxvf t-rex-0.20.3-linux.tar.gz t-rex \
    && rm -rf t-rex-0.20.3-linux.tar.gz -C /usr/local/bin
RUN find /usr/local/bin/

# cleanup
RUN apt -y remove wget \
    && apt -y autoremove

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# expose http api
EXPOSE 4067
ENTRYPOINT /entrypoint.sh
