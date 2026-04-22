#!/bin/bash
set -e

echo "Build new Docker image..."
docker build -t nginx-app .

echo "Run new container on port 8080..."
docker run -d -p 8080:80 --name nginx-new nginx-app

echo "Wait for container to be ready..."
sleep 5

echo "Stopping old container..."
docker stop nginx-container || true
docker rm nginx-container || true

echo "Starting new container on port 80..."
docker run -d -p 80:80 --name nginx-container nginx-app

echo "Cleaning up temporary container..."
docker stop nginx-new || true
docker rm nginx-new || true

echo "Deployment complete!"
