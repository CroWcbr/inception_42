DOCKER_COMPOSE_FILE = srcs/docker-compose.yml

all		:	build

build	:
			docker compose -f ${DOCKER_COMPOSE_FILE} build

up		:
			mkdir -p /home/cdarrell/data/mariadb
			mkdir -p /home/cdarrell/data/wordpress
			docker compose -f ${DOCKER_COMPOSE_FILE} up -d

down	:
			docker compose -f ${DOCKER_COMPOSE_FILE} down --volumes

re		:	fclean build up

fclean	:	down
			rm -rf /home/cdarrell/data/
			docker system prune -a -f