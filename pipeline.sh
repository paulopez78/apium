#!/bin/bash
set -e

#unit test build
# pushd ./src/votingapp
# go test
# GOOS=linux go build -o build/votingapp
# cp -r ./ui ./build
# popd

docker build -t paulopez/votingapp:0.2 ./src/votingapp

# integration test
docker rm -f voting || true
docker run -p 8080:5000 --name voting -d paulopez/votingapp:0.2
curl http://localhost:8080/vote

 #delivery
docker push paulopez/votingapp:0.2
echo "Deploying to prod..."