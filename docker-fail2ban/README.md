# docker-fail2ban-nginx

## Usage

```
$ docker run -d -it \
-v /var/log/nginx:/var/log/nginx \
--name fail2ban \
--net host \
--privileged \
thommeo/fail2ban-nginx:latest
```

## Build container

```
$ docker build --pull -t thommeo/fail2ban-nginx .
```
