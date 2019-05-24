# Project
runtime   := nodejs10.x
name      := slackbot-secrets
release   := $(shell git describe --tags)
build     := $(name)-$(release)
buildfile := build/$(build).build
distfile  := dist/$(build).zip

# Docker Build
image := amancevice/$(name)
digest = $(shell cat $(buildfile))

$(distfile): | $(buildfile) dist
	docker run --rm $(digest) cat /var/task/package.zip > $@

$(buildfile): | build
	docker build \
	--build-arg RUNTIME=$(runtime) \
	--iidfile $@ \
	--tag $(image):$(release) .

%:
	mkdir -p $@

.PHONY: clean

clean:
	docker image rm -f $(image) $(shell sed G build/*)
	rm -rf build dist
