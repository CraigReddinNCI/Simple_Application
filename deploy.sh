#!/usr/bin/env bash
# Stop and remove the old container if running
sudo docker stop simple_app || true
sudo docker rm simple_app || true

   # Ensure we get the latest version

# Run the
sudo docker run -d \
    -p 8443:8443 \
  --name simple_app \
  $IMAGE_APP