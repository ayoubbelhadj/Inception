all : up
up: 
	mkdir -p ~/data/db/
	mkdir -p ~/data/wp/
	docker-compose -f ./srcs/docker-compose.yml up
down:
	docker-compose -f ./srcs/docker-compose.yml down
	sudo rm -rf ~/data/db/*
	sudo rm -rf ~/data/wp/*
	docker image rm nginx-image mariadb-image

re : diw
PHONY: all up down