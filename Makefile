.PHONY: init clean create_network remove_network pull build push up down

.DEFAULT_GOAL = up

init: create_network

clean: remove_network

create_network:
	docker network create nginx-proxy || true

remove_network:
	docker network rm nginx-proxy || true

pull:
	docker-compose pull

build:
	docker build -t thommeo/nginx-proxy-access-log docker-nginx
	docker build -t thommeo/logrotate docker-logrotate
	docker build -t thommeo/fail2ban-auth-nginx docker-fail2ban

push:
	docker push thommeo/nginx-proxy-access-log
	docker push thommeo/logrotate
	docker push thommeo/fail2ban-auth-nginx

up:
	docker-compose up -d --remove-orphans

down:
	docker-compose down
