LOCAL_NAME=opencv
VERSION=3.4.3-cuda8.0-cudnn7
PUBLIC_NAME=docker-opencv
REPOSITORY=aryangold


.PHONY: all build tag release

all: build tag release

build:
	docker build -t $(LOCAL_NAME):$(VERSION) --rm .

tag: build
	docker tag $(LOCAL_NAME):$(VERSION) $(REPOSITORY)/$(PUBLIC_NAME):$(VERSION)

release: tag
	docker push $(REPOSITORY)/$(PUBLIC_NAME):$(VERSION)

