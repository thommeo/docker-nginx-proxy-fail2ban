FROM alpine:3.8

RUN apk --update --no-cache add tini logrotate
RUN echo "*/5 * * * *	/usr/sbin/logrotate	/etc/logrotate.conf" >> /etc/crontabs/root
COPY logrotate.conf /etc/logrotate.conf

ENTRYPOINT ["/sbin/tini", "--"]

CMD ["crond", "-f", "-l", "6", "-L", "/dev/stdout"]
