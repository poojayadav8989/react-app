#!/bin/bash
set -e

echo "Logging into Docker Hub"
docker login -u $DOCKER_USERNAME -p $DOCKER_PASSWORD

echo "Pushing image to Docker Hub"
docker push poojayadav253/react-app:latest

echo "Deploying container"
docker stop react-app || true
docker rm react-app || true

docker run -d -p 80:80 --name react-app poojayadav253/react-app:latest

