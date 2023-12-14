#!/bin/sh
docker run --rm -it -v "${PWD}":/build  ubuntu:jammy-20221101 /build/docker_entry.sh | tee build.log
