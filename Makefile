runtime   := nodejs10.x
name      := slackbot-secrets
build     := $(shell git describe --tags)

image   := amancevice/$(name)
iidfile := .docker/$(build)
digest   = $(shell cat $(iidfile))

$(name)-$(build).zip: main.tf outputs.tf variables.tf | $(iidfile)
	zip $@ $?

$(iidfile): | .docker
	docker build \
	--build-arg RUNTIME=$(runtime) \
	--iidfile $@ \
	--tag $(image):$(build) .

.docker:
	mkdir -p $@

.PHONY: shell clean

shell: | $(iidfile)
	docker run --rm -it $(digest) /bin/bash

clean:
	docker image rm -f $(image) $(shell sed G .docker/*)
	rm -rf .docker $(name)*.zip
