#!/bin/bash

set -e

echo "🚀 Starting deployment..."

cd ~/devops-private-nginx-site

echo "🛑 Stopping old container..."
docker stop mysite || true

echo "🗑 Removing old container..."
docker rm mysite || true

echo "📦 Building new Docker image..."
docker build -t mysite .

echo "🚀 Running new container..."
docker run -d -p 80:80 --name mysite mysite

echo "✅ Deployment complete!"
docker ps
