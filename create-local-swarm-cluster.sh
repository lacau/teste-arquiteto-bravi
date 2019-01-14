#!/bin/bash

# init swarm (need for service command); if not created
docker node ls 2> /dev/null | grep "Leader"
if [ $? -ne 0 ]; then
  echo "Initializing swarm cluster"
  docker swarm init > /dev/null 2>&1
fi

# get join token
SWARM_TOKEN=$(docker swarm join-token -q worker)

# get Swarm master IP
SWARM_MASTER=$(docker info --format "{{.Swarm.NodeAddr}}")
echo "Swarm master IP: ${SWARM_MASTER}"

# verify local ip
if [ -z "$SWARM_MASTER" ]; then
  echo "Cant choose a network to init swarm cluster. Go to Troubleshooting section in README.md"
  exit 1
fi

sleep 10

# show swarm cluster
printf "\nLocal Swarm Cluster\n===================\n"

docker node ls

# echo swarm visualizer
printf "\nLocal Swarm Visualizer\n===================\n"
docker run -it -d --name swarm_visualizer \
  -p 8000:8080 -e HOST=localhost \
  -v /var/run/docker.sock:/var/run/docker.sock \
  dockersamples/visualizer
