# GROMACS_CP2K_Singularity VERSION
# MIT LICENSE
# Copyright (c) 2022 CondaPereira <https://github.com/CondaPereira>
FROM alpine:3.12

# AUTHOR ZeKai Shen

ENV DEBIAN_FRONTEND=noninteractive
WORKDIR /opt/gromacs-cp2k
COPY . /opt/gromacs-cp2k/

RUN set -x; buildDeps='cmake g++ gfortran build-base perl coreutils bash libexecinfo-dev libexecinfo openblas-dev lapack-dev wget git zlib-dev gsl-dev vim python3 py3-pip openssh linux-headers' \
	&& sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories \
	&& apk update \
	&& apk upgrade \
	&& apk add --no-cache -U $buildDeps \
	&& ln -s /usr/bin/python3 /usr/bin/python \
	&& pip3 install -r requirements.txt -i https://pypi.tuna.tsinghua.edu.cn/simple \
	&& chmod +x shfmt_v3.2.2_linux_amd64 \
	&& ln -s /opt/gromacs-cp2k/shfmt_v3.2.2_linux_amd64 /usr/bin/shfmt 

# WE'D BETTER RUN THIS SCRIPTS WITHOUT CACHES AS FOLLOWS
# docker build --no-caches -t your_docker_name


