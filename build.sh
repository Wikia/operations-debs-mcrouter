#!/bin/sh
docker run --rm -it -v "${PWD}":/build  ubuntu:bionic-20200403 /build/docker_entry.sh
