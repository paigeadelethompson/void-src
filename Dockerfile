ARG IMAGE=paigeadele/void:latest

ARG TAG="armr64" 

FROM ${IMAGE} AS base

WORKDIR /usr/src

RUN xbps-install -Suy

RUN xbps-install -Suy xbps

RUN xbps-install -Suy gcc-ada git make bsdtar patch pkg-config curl ca-certificates wget

RUN wget https://github.com/void-linux/void-packages/archive/refs/heads/master.zip

RUN unzip master.zip

RUN mv void-packages-master void-packages

WORKDIR /usr/src/void-packages

RUN chown -R root:nogroup . 

RUN chmod 0770 .

USER nobody

RUN ./xbps-src binary-bootstrap ; true

CMD /bin/bash
