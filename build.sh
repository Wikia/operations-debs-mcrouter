#!/bin/sh
docker build --progress=plain -t mcrouter-build . 2>&1 | tee build.log
docker run --rm -v "${PWD}":/output mcrouter-build \
  sh -c 'find /build -maxdepth 1 -name "*.deb" -exec cp {} /output/ \;'
