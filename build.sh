#!/bin/sh
docker run --rm -it -v "${PWD}":/build  ubuntu:resolute /build/docker_entry.sh | tee build.log
