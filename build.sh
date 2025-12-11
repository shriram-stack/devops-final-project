#!/bin/bash
# build.sh - Build Docker image for dev or prod

DOCKER_USERNAME="shriram123"
IMAGE_NAME="$DOCKER_USERNAME/react-app"

if [ -z "$1" ]; then
    echo "Usage: ./build.sh <dev|prod>"
    echo "Example: ./build.sh dev"
    exit 1
fi

TAG=$1

echo "Building image: $IMAGE_NAME:$TAG"
docker build -t $IMAGE_NAME:$TAG .

echo ""
echo "Build completed!"
echo "Image: $IMAGE_NAME:$TAG"
echo "To push → docker push $IMAGE_NAME:$TAG"
