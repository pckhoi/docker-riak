#! /usr/bin/env bash

set -e

if env | grep -q "DOCKER_RIAK_DEBUG"; then
  set -x
fi

docker ps -a | egrep "hectcastro/riak" | cut -d" " -f1 | xargs -I{} docker rm -f {} > /dev/null 2>&1

echo "Stopped the cluster and cleared all of the running containers."
