ARG NVIDIA_CUDA_VERSION=11.2.0
ARG NVIDIA_CUDA_BASE_IMAGE=base-ubuntu18.04
ARG NVIDIA_CUDA_IMAGE_TAG=${NVIDIA_CUDA_VERSION}-${NVIDIA_CUDA_BASE_IMAGE}
FROM nvidia/cuda:$NVIDIA_CUDA_IMAGE_TAG


LABEL Robin Ostlund <me@robinostlund.name>

# arg variables
ARG TREX_VERSION=0.20.3
ARG TREX_TAR_FILE=t-rex-${TREX_VERSION}-linux.tar.gz

# env variables
ENV ALGO=ethash
ENV SERVER=stratum+tcp://eu1.ethermine.org:4444
ENV USERNAME=0xD0469ac9d8935EBffb706EDc9D45a9c522d04f13
ENV PASSWORD=x
ENV WORKER_NAME=githubworker

# install packages
RUN apt update \
    && apt -y install wget

# fetch t-rex and unpack it
RUN cd /tmp \
    && wget -q https://github.com/trexminer/T-Rex/releases/download/$TREX_VERSION/$TREX_TAR_FILE \
    && tar -zxvf $TREX_TAR_FILE t-rex \
    && mv t-rex /usr/local/bin \
    && rm -rf $TREX_TAR_FILE

# cleanup
RUN apt -y remove wget \
    && apt -y autoremove

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# expose http api
EXPOSE 4067
ENTRYPOINT /entrypoint.sh
