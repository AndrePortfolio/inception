SRC_DIR=srcs
DOCKER_COMPOSE=docker-compose -f $(SRC_DIR)/docker-compose.yml

all: build

build:
	$(DOCKER_COMPOSE) up --build -d

down:
	$(DOCKER_COMPOSE) down

clean:
	$(DOCKER_COMPOSE) down -v --rmi all
	rm -rf /home/andre/data

fclean: clean
	docker builder prune -f
	docker container prune -f
	docker network prune -f
	docker volume prune -f
	docker image prune -a -f
	docker system prune -a --volumes -f

re: fclean all
