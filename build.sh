#!/bin/bash

# Simple Docker Build Script
# Builds the frontend image locally and runs it

set -e

echo "Building Docker image locally..."

# Stop and remove existing container if it exists
echo "Cleaning up existing container..."
docker stop frontend-container 2>/dev/null || true
docker rm frontend-container 2>/dev/null || true

# Build Docker image
echo "Building frontend-app image..."
docker build -t frontend-app:latest .

echo "Build completed successfully!"
echo "Local image: frontend-app:latest"
echo ""

# Run the container
echo "Starting frontend container..."
docker run -d --name frontend-container \
    -p 3000:80 \
    frontend-app:latest

echo "Container started successfully!"
echo "Container name: frontend-container"
echo ""
echo "To check logs:"
echo "  docker logs frontend-container"
echo ""
echo "To follow logs in real-time:"
echo "  docker logs -f frontend-container"
echo ""
echo "To stop the container:"
echo "  docker stop frontend-container"