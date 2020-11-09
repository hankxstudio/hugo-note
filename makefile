IMAGE_NAME = hugo-note
PORT = 3030
NGINX_PORT = 80
CONTAINER_NAME = hugo-container

.PHONEY: build
build:
	docker rmi -f ${IMAGE_NAME}
	docker build -t ${IMAGE_NAME} .


.PHONEY: run
run:
	docker stop ${CONTAINER_NAME} || true
	docker rm {CONTAINER_NAME} || true
	docker run -dp ${PORT}:${NGINX_PORT} ${IMAGE_NAME}