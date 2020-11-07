DOCKER_IMAGE=jekyll/jekyll
#DOCKER_TAG?=$(shell ./datomic-version)
DOCKER_TAG?=4.1.0
CURRENT_DIR=$(CURDIR)

.PHONY: all build serve clean info

all: build

	docker run --rm --name mube-resume-build --volume=$(CURRENT_DIR):/srv/jekyll -it $(DOCKER_IMAGE):$(DOCKER_TAG) jekyll build

serve:

	docker run --rm --name mube-resume-serve --volume=$(CURRENT_DIR):/srv/jekyll -p 3000:4000 -it $(DOCKER_IMAGE):$(DOCKER_TAG) jekyll serve --watch


clean:
	docker rmi $(DOCKER_IMAGE):$(DOCKER_TAG)

info:
	@echo "Docker image: $(DOCKER_IMAGE):$(DOCKER_TAG)"

