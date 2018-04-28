APP_NAME=myfitnesspal-minder

build:
	docker build -t $(APP_NAME) .

build-nc: # without caching
	docker build --no-cache -t $(APP_NAME) .

run:
	docker run -i -t --rm --env-file=./.env --name="$(APP_NAME)" $(APP_NAME)
run-dev:
	docker run -i -t --rm --env-file=./.env --volume=${PWD}:/usr/src/app:ro --name="$(APP_NAME)" $(APP_NAME)

up: build run
dev: build run-dev

stop:
	docker stop $(APP_NAME); docker rm $(APP_NAME)
