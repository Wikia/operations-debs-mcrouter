#!/bin/sh
docker run --rm -it -v "${PWD}":/build  docker-registry.wikimedia.org/bullseye:latest /build/docker_entry.sh
