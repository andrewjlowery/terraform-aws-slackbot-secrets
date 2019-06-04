# Project
runtime   := nodejs10.x
name      := slackbot-secrets
release   := $(shell git describe --tags)
build     := $(name)-$(release)
builddir  := .docker
buildfile := $(builddir)/$(build)
distfile  := $(build).zip

# Docker Build
image := amancevice/$(name)
digest = $(shell cat $(buildfile))

$(distfile): $(buildfile)
	docker run --rm $(digest) cat /var/task/package.zip > $@

$(buildfile): | $(builddir)
	docker build \
	--build-arg RUNTIME=$(runtime) \
	--iidfile $@ \
	--tag $(image):$(release) .

$(builddir):
	mkdir -p $@

.PHONY: clean

clean:
	docker image rm -f $(image) $(shell sed G $(builddir)/*)
	rm -rf $(builddir) *.zip
