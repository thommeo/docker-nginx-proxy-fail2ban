FROM nginx:stable-alpine

ENV CONFD_VERSION=0.16.0

# Build confd
RUN apk add --update --no-cache --virtual .confd-dependencies make go git musl-dev && \
    mkdir -p /tmp/gopath/src/github.com/kelseyhightower/confd && \
    git clone https://github.com/kelseyhightower/confd.git /tmp/gopath/src/github.com/kelseyhightower/confd && \
    cd /tmp/gopath/src/github.com/kelseyhightower/confd && \
    git checkout -q --detach "v$CONFD_VERSION" && \
    GOPATH=/tmp/gopath/vendor:/tmp/gopath make && \
    mv ./bin/confd /usr/local/bin/ && \
    apk del .confd-dependencies && \
    rm -rf /tmp/gopath

# Set to reverse proxy IP address
ENV SET_REAL_IP_FROM=

COPY rootfs/ /

ENTRYPOINT ["/entrypoint.sh"]

CMD ["nginx", "-g", "daemon off;"]
