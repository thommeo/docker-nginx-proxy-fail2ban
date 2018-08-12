# docker-logrotate

Truncates container logs when they grow in size

## Usage

```
docker build -t docker-logrotate .
docker run -d -v /var/log/nginx:/var/log/rotate:rw docker-logrotate
```
