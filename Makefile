setup:
	docker-compose run --rm auth-dev rails db:create

migrate/apply-local:
	rake ridgepole:apply

migrate/apply:
	docker-compose run --rm auth-dev make migrate/apply-local