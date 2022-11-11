FROM ubuntu:20.04

# AUTHOR ZeKai Shen

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update 2>/dev/null | grep packages | cut -d '.' -f 1 && apt-get upgrade -y
RUN apt-get install cmake g++ gfortran build-essential liblapack-dev libopenblas-dev wget git libz-dev libgsl-dev vim -y \
    && mkdir /data

WORKDIR /opt/cp2k-precommit
COPY . /opt/cp2k-precommit/
RUN ./install_requirements.sh
