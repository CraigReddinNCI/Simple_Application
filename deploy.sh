#!/usr/bin/env bash

# Stop and remove the old container if running
docker stop simple_app || true
docker rm simple_app || true

# Run the new container
docker run -d \
  -p 8080:8080 -p 8443:8443 \
  --name simple_app \
  $IMAGE_APP