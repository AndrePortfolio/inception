# Variables
SRC_DIR=srcs
DOCKER_COMPOSE=docker compose -f $(SRC_DIR)/docker-compose.yml

# Targets
all: build

build:
	$(DOCKER_COMPOSE) up --build -d

down:
	$(DOCKER_COMPOSE) down

clean:
	$(DOCKER_COMPOSE) down -v --rmi all
	rm -rf /home/andre/data

fclean:
	docker builder prune -f

re: clean all
