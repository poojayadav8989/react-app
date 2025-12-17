#!/bin/bash
set -e

echo "Installing dependencies"
npm install

echo "Building React app"
npm run build

echo "Building Docker image"
docker build -t poojayadav253/react-app:latest .



