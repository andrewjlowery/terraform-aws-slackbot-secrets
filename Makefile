REPO      := amancevice/slackbot-secrets
TERRAFORM := latest
BUILD     := $(shell git describe --tags --always)

.PHONY: default clean clobber shell

default: .docker/$(BUILD)

.docker:
	mkdir -p $@

.docker/$(BUILD): | .docker
	docker build \
	--build-arg TERRAFORM=$(TERRAFORM) \
	--iidfile $@ \
	--tag $(REPO) \
	.

clean:
	rm -rf .docker

clobber: clean
	docker image ls $(REPO) --quiet | uniq | xargs docker image rm --force

shell: .docker/$(BUILD)
	docker run --rm -it --entrypoint sh $$(cat $<)
