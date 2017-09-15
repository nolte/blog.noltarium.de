#!/bin/bash
set -o errexit

VERSION=$1

docker build .
docker login -u="$DOCKER_USERNAME" -p="$DOCKER_PASSWORD"
docker build -t jekyll-boilerplate .
docker tag jekyll-boilerplate $DOCKER_USERNAME/jekyll-boilerplate:$VERSION
docker push $DOCKER_USERNAME/jekyll-boilerplate:$VERSION
