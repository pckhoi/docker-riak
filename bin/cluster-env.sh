#! /usr/bin/env bash


if [[ "${DOCKER_HOST}" == unix://* ]]; then
  CLEAN_RIAK_HOST="localhost"
else
  CLEAN_RIAK_HOST=$(echo "${DOCKER_HOST}" | cut -d'/' -f3 | cut -d':' -f1)
fi

RIAK_CONTAINER_IDS=($(docker ps | egrep "hectcastro/riak" | cut -d" " -f1))
declare -A RIAK_PORTS=()

for i in "${!RIAK_CONTAINER_IDS[@]}"
do
	RIAK_PORTS[$i]=$(docker port "${RIAK_CONTAINER_IDS[$i]}" 8098 | cut -d ":" -f2)
done
