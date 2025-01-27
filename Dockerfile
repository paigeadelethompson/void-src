ARG IMAGE=paigeadele/void:latest

ARG TAG="armr64" 

FROM ${IMAGE} AS base

WORKDIR /usr/src

RUN xbps-install -Suy

RUN xbps-install -Suy xbps

RUN xbps-install -Suy gcc-ada git make bsdtar patch pkg-config curl ca-certificates

RUN git clone https://github.com/void-linux/void-packages.git

RUN rm -rf /usr/bin/qemu-*-static ; true

WORKDIR /usr/src/void-packages

RUN chown -R root:nogroup . 

RUN chmod 0770 .

USER nobody

RUN ./xbps-src binary-bootstrap
