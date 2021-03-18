IMAGE_NAME := $(shell basename $(CURDIR))
IMAGE_TAG  := latest

# By defining your base image here, you can re-use it in pre/post build stages.
BASE_REPO  ?= debian
BASE_TAG   ?= stable-slim

.PHONY: post-build
post-build: build
  # Add your post-build stages here
	@echo "No post-build stages, build competed!"

.PHONY: build
build: pre-build
	docker build \
		--build-arg BASE_REPO=$(BASE_REPO) \
		--build-arg BASE_TAG=$(BASE_TAG) \
		-t $(IMAGE_NAME):$(IMAGE_TAG) .

.PHONY: pre-build
pre-build: build
	# Add your pre-build stages here
	@echo "No pre-build stages, building ... "
