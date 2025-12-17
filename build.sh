#!/bin/bash
set -e

# Add Node, npm, Docker to PATH so Jenkins can find them
export PATH=/opt/homebrew/bin:/usr/local/bin:$PATH

echo "Installing dependencies"
npm install

echo "Building React app"
npm run build

echo "Building Docker image"
docker build -t poojayadav253/react-app:latest .

