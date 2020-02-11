TERRAFORM := latest
BUILD     := $(shell git describe --tags --always)

.PHONY: default clean clobber shell test

default: test

.docker:
	mkdir -p $@

.docker/$(BUILD): | .docker
	docker build \
	--build-arg RUNTIME=$(RUNTIME) \
	--build-arg TERRAFORM=$(TERRAFORM) \
	--iidfile $@@$(TIMESTAMP) \
	--tag amancevice/slackbot-slash-command:$(BUILD) \
	.
	cp $@@$(TIMESTAMP) $@

clean:
	-rm -rf .docker/$(BUILD)

clobber: | .docker
	-awk {print} .docker/* 2> /dev/null | uniq | xargs docker image rm --force
	-rm -rf .docker node_modules

test: .docker/$(BUILD)

shell: .docker/$(BUILD)
	docker run --rm -it --entrypoint sh $(shell cat $<)
