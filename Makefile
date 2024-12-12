SRC_DIR=srcs
DOCKER_COMPOSE=docker-compose -f $(SRC_DIR)/docker-compose.yml

all: build

build:
	mkdir -p /home/andre-da/data/
	mkdir -p /home/andre-da/data/mariadb_data
	mkdir -p /home/andre-da/data/wordpress_data
	$(DOCKER_COMPOSE) up --build -d

down:
	$(DOCKER_COMPOSE) down

clean:
	$(DOCKER_COMPOSE) down -v --rmi all
	rm -rf /home/andre-da/data

fclean: clean
	docker builder prune -f
	docker container prune -f
	docker network prune -f
	docker volume prune -f
	docker image prune -a -f
	docker system prune -a --volumes -f

eval:
	docker stop $(docker ps -qa);
	docker rm $(docker ps -qa);
	docker rmi -f $(docker images -qa);
	docker volume rm $(docker volume ls -q);
	docker network rm $(docker network ls -q) 2>/dev/null;

re: fclean all
