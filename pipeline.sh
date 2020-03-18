#!/bin/bash
set -e

registry=${REGISTRY:-"paulopez"}
version=${VERSION:-"0.1"}
image=$registry/votingapp:$version

#unit test build
# pushd ./src/votingapp
# go test
# GOOS=linux go build -o build/votingapp
# cp -r ./ui ./build
# popd

docker build -t "$image" ./src/votingapp

# integration test
docker rm -f voting || true
docker run -p 8080:5000 --name voting -d "$image"

curl http://localhost:8080/vote

 #delivery
docker push "$image"
echo "Deploying to prod..."