UID := `id -u`
GID := `id -g`

up:
	docker compose up -d
down:
	docker compose down
restart:
	docker compose down && docker-compose up -d
build:
	docker compose build --build-arg UID=$(UID) --build-arg GID=$(GID) 
logs:
	docker compose logs -f
shell:
	docker compose exec app poetry shell

test:
	echo $(UID)