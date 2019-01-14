#!/bin/bash
source define-variables.sh

IMAGE_TAG="$IMAGE_NAME:v$VERSION.local"

sed -i "s/\(.*image: current-version.*\)/    image: $IMAGE_TAG/g" docker-compose.yml

docker stack deploy --compose-file docker-compose.yml braviapp

sed -i "s/\(.*image: $IMAGE_TAG.*\)/    image: current-version/g" docker-compose.yml
