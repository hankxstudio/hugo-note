IMAGE_NAME = hugo-note
PORT = 80
NGINX_PORT = 8080
CONTAINER_NAME = hugo-container

.PHONEY: build
build:
	docker rmi -f ${IMAGE_NAME}
	docker build -t ${IMAGE_NAME} .


.PHONEY: run
run:
	docker stop ${CONTAINER_NAME} || true
	docker rm ${CONTAINER_NAME} || true
	docker run -dp ${PORT}:${NGINX_PORT} --name ${CONTAINER_NAME} ${IMAGE_NAME}

.PHONEY: hugo
hugo:
	rm -rf public
	hugo