#!/bin/bash
set -e
cd src/votingapp
pkill votingapp || echo "Cleaning up..." && true
echo $?
go build -o votingapp
echo $?
./votingapp 1> log.txt &
echo $?
curl http://localhost:5000/vote

    echo "Deploying to prod..."
# if [[ $? -gt 0 ]] ; then
#     echo "Failed!"
# else
#     echo "Deploying to prod..."
# fi
