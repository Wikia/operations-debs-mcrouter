#!/bin/sh
if [ "$(df /data/docker --output=pcent | tail -1 | tr -dc '0-9')" -ge 80 ]; then
  docker system prune -f
fi
docker build --progress=plain -t mcrouter-build . 2>&1 | tee build.log
docker run --rm --dns 8.8.8.8 -v "${PWD}":/output mcrouter-build \
  sh -c 'find /build -maxdepth 1 -name "*.deb" -exec cp {} /output/ \;'
