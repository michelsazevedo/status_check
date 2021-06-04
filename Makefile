WORKDIR   = $(realpath .)
APP_NAME ?= status_check
MIX_ENV  ?= prod

ELIXIR_DOCKER_IMAGE ?= elixir:1.12.0

.PHONY: start build run test
.SILENT: build run test deps

URLS = "google.com" "http://www.bing.com" "inactive-domain.blah" "htpp://not-a-web-url"

start:
	$(eval CONTAINER := $(shell docker run -dt --name $(APP_NAME) \
		-e MIX_ENV=$(MIX_ENV) -v $(WORKDIR):/$(APP_NAME) \
		-w /$(APP_NAME) $(ELIXIR_DOCKER_IMAGE)))

deps: start
	echo "❄️  deps.get ..."
	docker exec $(CONTAINER) bash -c "mix local.hex --force" > /dev/null
	docker exec $(CONTAINER) bash -c "mix local.rebar --force" > /dev/null
	docker exec $(CONTAINER) bash -c "mix deps.get" > /dev/null

build: start deps
	docker exec $(CONTAINER) mix escript.build

run: build
	docker exec $(CONTAINER) ./$(APP_NAME) $(URLS)
	docker rm -f $(APP_NAME)

test: start deps
	docker exec $(CONTAINER) mix test
	docker rm -f $(APP_NAME)

