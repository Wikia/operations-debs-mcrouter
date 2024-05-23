#!/bin/sh
docker run --rm -it --platform linux/amd64  -v "${PWD}":/build  ubuntu:jammy-20240530 /build/docker_entry.sh | tee build.log
