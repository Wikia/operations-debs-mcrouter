#!/bin/sh
docker run --rm -it -v "${PWD}":/build  docker-registry.wikimedia.org/wikimedia-buster:latest /build/docker_entry.sh
