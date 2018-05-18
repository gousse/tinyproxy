#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $DIR

source $DIR/env.sh
docker network create proxy 2>/dev/null

docker container stop tinyproxy 2>/dev/null
docker container rm tinyproxy 2>/dev/null
docker container run --name tinyproxy \
  --restart always \
  -v $DIR/config:/etc/tinyproxy \
  --network=proxy \
  -p $TINY_LISTEN_IP:8888:8888 \
  -p 127.0.0.1:8888:8888 \
  -d \
  tinyproxy:latest
