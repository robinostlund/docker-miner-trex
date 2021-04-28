#FROM ubuntu:18.04
FROM nvidia/cuda:11.1-base-ubuntu18.04

LABEL Gershon <gershon@medooza.io>

WORKDIR /root

RUN apt update
RUN apt -y install wget 
#RUN wget https://github.com/trexminer/T-Rex/releases/download/0.19.14/t-rex-0.19.14-linux-cuda11.1.tar.gz
RUN tar -xzf t-rex-0.19.14-linux-cuda11.1.tar.gz

RUN wget https://github.com/trexminer/T-Rex/releases/download/0.20.3/t-rex-0.20.3-linux.tar.gz
RUN tar -xzf t-rex-0.20.3-linux.tar.gz


ENV ETH_ADDRESS=0xD0469ac9d8935EBffb706EDc9D45a9c522d04f13
ENV SERVER=eu1.ethermine.org:5555
ENV WORKER_NAME=githubworker

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT /entrypoint.sh
