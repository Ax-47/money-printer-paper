.PHONY: all build watch clean shell

all: build

build:
	docker compose run --rm latex

watch:
	docker compose run --rm watch

clean:
	docker compose run --rm clean

shell:
	docker compose run --rm latex bash
