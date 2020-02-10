# fail2ban-auth-nginx

## Usage

``` shell
docker run -d -it \
  -v /var/log/nginx:/var/log/nginx \
  --name fail2ban \
  --net host \
  --privileged \
  thommeo/fail2ban-nginx:latest
```

## Build container

``` shell
docker build --pull -t thommeo/fail2ban-auth-nginx .
```
