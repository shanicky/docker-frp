FROM alpine:latest
MAINTAINER Shanicky <shanickyc@gmail.com>

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories

ENV VERSION="0.29.1"

RUN apk add --no-cache --update wget \
 && wget --no-check-certificate https://github.com/fatedier/frp/releases/download/v${VERSION}/frp_${VERSION}_linux_amd64.tar.gz \
 && tar zxvf frp_${VERSION}_linux_amd64.tar.gz \
 && mv frp_${VERSION}_linux_amd64/frp* /usr/local/bin/ \
 && rm -r frp_${VERSION}_linux_amd64* \
 && chmod +x /usr/local/bin/frp*

VOLUME /etc/frp
