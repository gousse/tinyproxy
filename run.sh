#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $DIR
docker container stop tinyproxy >/dev/null
docker container rm tinyproxy >/dev/null
docker container run --name tinyproxy \
  --restart always \
  -v $DIR/config:/etc/tinyproxy \
  -p 127.0.0.1:8888:8888 \
  -d \
  tinyproxy:latest
