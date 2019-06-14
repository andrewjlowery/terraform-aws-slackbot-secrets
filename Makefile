name    := slackbot-secrets
runtime := nodejs10.x
build   := $(shell git describe --tags --always)
digest   = $(shell cat .docker/$(build))

.PHONY: all clean shell

all: .docker/$(build)

.docker:
	mkdir -p $@

.docker/$(build): | .docker
	docker build \
	--build-arg RUNTIME=$(runtime) \
	--iidfile $@ \
	--tag amancevice/$(name):$(build) .

clean:
	docker image rm -f $(shell awk {print} .docker/*)
	rm -rf .docker

shell: .docker/$(build)
	docker run --rm -it $(digest) /bin/bash
