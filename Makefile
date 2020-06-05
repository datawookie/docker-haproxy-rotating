VERSION=0.0.1
IMAGE=datawookie/haproxy-rotating

# IMAGE -----------------------------------------------------------------------

build:
	docker build -t $(IMAGE) -t $(IMAGE):$(VERSION) .

login:
	docker login

# First need to login.
#
push:
	docker push $(IMAGE)

pull:
	docker pull $(IMAGE)

# CONTAINER -------------------------------------------------------------------

run:
	-docker run --rm --name haproxy-rotating -p 3128:3128 $(IMAGE)