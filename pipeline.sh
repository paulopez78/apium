#!/bin/bash
set -e

docker-compose rm -f || true
docker-compose build
docker-compose up --exit-code-from voting-test --abort-on-container-exit

docker-compose push voting
echo "Deploying to prod..."