#!/bin/bash
# deploy.sh - Deploy the app on any server

DOCKER_USERNAME="shriram123"
TAG=${1:-latest}
IMAGE="$DOCKER_USERNAME/react-app:$TAG"

echo "Deploying $IMAGE ..."

# Pull the image
docker pull $IMAGE

# Remove old container if exists
docker stop react-app-container 2>/dev/null || true
docker rm react-app-container 2>/dev/null || true

# Run new container
docker run -d \
  --name react-app-container \
  -p 80:80 \
  --restart unless-stopped \
  $IMAGE

echo ""
echo "Deployed successfully!"
echo "Open in browser: http://$(curl -s ifconfig.me || hostname -I | awk '{print $1}')"

