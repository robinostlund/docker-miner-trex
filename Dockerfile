#FROM ubuntu:18.04
FROM nvidia/cuda:11.3.0-base-ubuntu18.04

LABEL Robin Ostlund <me@robinostlund.name>

WORKDIR /root

# instal packages
RUN apt update
RUN apt -y install wget 

# fetch t-rex and unpack it
RUN wget -q https://github.com/trexminer/T-Rex/releases/download/0.20.3/t-rex-0.20.3-linux.tar.gz \
    && tar -zxvf t-rex-0.20.3-linux.tar.gz t-rex \
    && rm -rf t-rex-0.20.3-linux.tar.gz
RUN find .

# cleanup
RUN apt -y remove wget

ENV ETH_ADDRESS=0xD0469ac9d8935EBffb706EDc9D45a9c522d04f13
ENV SERVER=eu1.ethermine.org:5555
ENV WORKER_NAME=githubworker

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT /entrypoint.sh
