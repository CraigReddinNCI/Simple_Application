#!/usr/bin/env bash
# Stop and remove the old container if running
sudo docker stop simple_app || true
sudo docker rm simple_app || true
sudo docker rmi -f $IMAGE_APP:latest  # Remove the old image
sudo docker pull $IMAGE_APP:latest    # Ensure we get the latest version

# Run the new 
sudo docker run -d \
    -p 8443:8443 \
  --name simple_app \
  --pull always \
  $IMAGE_APP