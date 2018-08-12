FROM alpine:3.8

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

RUN apk add --no-cache dumb-init fail2ban && \
    rm /etc/fail2ban/jail.d/* && \
    ln -sf /dev/stdout /var/log/fail2ban.log

COPY rootfs/ /

# Set to any non-empty value to make iptables drop packets containing 'X-Forwarded-For: <BANNED_IP>'
ENV FILTER_X_FORWARDED_FOR=

# Specify comma separated list of ports on the host that you want the ban to affect
ENV PORTS=

# When receiving SIGTERM on `docker stop` send SIGINT to child for graceful shutdown
ENTRYPOINT ["/usr/bin/dumb-init", "--rewrite", "15:2", "--", "/entrypoint.sh"]
