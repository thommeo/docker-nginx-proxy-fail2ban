# docker-nginx-proxy-fail2ban

Docker nginx proxy container featuring automatic virtual hosts creation and blocking unauthorized clients with fail2ban.

nginx proxy container creates access logs on filesystem. Set environment variable `SET_REAL_IP_FROM=<IP>` on the container to use `X-Forwarded-For` header sent by a trusted proxy with specified IP address.

fail2ban container monitors access logs for responses with 401 HTTP status code. If the event number reaches the threshold fail2ban blocks the IP listed in the access log with iptables on the host. To do that, fail2ban container is privileged. fail2ban container environment variables:

* `EXPOSED_PORT` — comma separated list of the ports that need to be blocked for banned IPs on the host. Set to the ports `proxy` container publishes on the host.
* `FILTER_X_FORWARDED_FOR` — set to any truthy value to tell iptables to drop packets containing banned IP in `X-Forwarded-For: <IP>` HTTP header. Use when host is behind another reverse proxy.

`logrotate` container truncates access log when it grows in size.

See `.env-example` for environment variables.

## References

* [jwilder/nginx-proxy](https://github.com/jwilder/nginx-proxy)
* [jwilder/docker-gen](https://github.com/jwilder/docker-gen)
* [SuperITMan/docker-fail2ban](https://github.com/SuperITMan/docker-fail2ban)
* [tini](https://github.com/krallin/tini)
* [confd](https://github.com/kelseyhightower/confd)

## Usage

Create network

```
make init
```

Start containers

```
make pull up
```

Build images

```
make build
```
