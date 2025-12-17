#!/bin/bash
set -e

export PATH=/opt/homebrew/bin:$PATH


echo "Installing dependencies"
/opt/homebrew/bin/node /opt/homebrew/bin/npm install

echo "Building React app"
/opt/homebrew/bin/node /opt/homebrew/bin/npm run build

echo "Building Docker image"
docker build -t poojayadav253/react-app:latest .


