up:
	docker compose up -d
down:
	docker compose down
restart:
	docker compose down && docker-compose up -d
build:
	docker compose build
logs:
	docker compose logs -f
shell:
	docker compose exec app poetry shell