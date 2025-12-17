#!/bin/bash
set -e


export PATH=/opt/homebrew/bin:/usr/local/bin:$PATH

echo "Installing dependencies"
npm install

echo "Building React app"
npm run build

echo "Building Docker image"
docker build -t poojayadav253/react-app:latest .

