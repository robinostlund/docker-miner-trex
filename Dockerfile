ARG TREX_VERSION=0.20.3
ARG TREX_TAR_FILE=t-rex-0.20.3-linux.tar.gz
ARG NVIDIA_CUDA_IMAGE_TAG=11.2.0-base-ubuntu18.04
FROM nvidia/cuda:$NVIDIA_CUDA_IMAGE_TAG

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

# wget -q https://github.com/trexminer/T-Rex/releases/download/0.20.3/t-rex-0.20.3-linux.tar.gz

# fetch t-rex and unpack it
RUN cd /tmp \
    && wget -q https://github.com/trexminer/T-Rex/releases/download/$TREX_VERSION/$TREX_TAR_FILE \
    && tar -zxvf $TREX_TAR_FILE t-rex -C /usr/local/bin \
    && rm -rf $TREX_TAR_FILE
RUN find /usr/local/bin/

# cleanup
RUN apt -y remove wget \
    && apt -y autoremove

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# expose http api
EXPOSE 4067
ENTRYPOINT /entrypoint.sh
