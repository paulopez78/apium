#!/bin/bash
set -e

# registry=${REGISTRY:-"paulopez"}
# version=${VERSION:-"0.1"}
# image=$registry/votingapp:$version

docker-compose rm -f || true
docker-compose build
docker-compose up --exit-code-from voting-test --abort-on-container-exit

docker-compose push voting
echo "Deploying to prod..."
# docker network create voting-network || true

# docker build -t "$image" ./src/votingapp

# # Infra (db, proxy, log, ...)
# docker rm -f mycache || true
# docker run --name mycache -p 6379:6379 --network voting-network -d redis

# # integration test

# # 1. Run VotingApp WebServer
# docker rm -f voting || true
# docker run -e REDIS=mycache:6379 --name voting -d --network voting-network "$image"

# # curl http://localhost:8080/vote
# docker build -t voting-test ./test
# docker run -e VOTING_URL=voting:5000 --network voting-network voting-test

# Exit or success? @?


 #delivery
# docker push "$image"