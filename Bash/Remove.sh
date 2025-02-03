#!/bin/bash

docker stop $(docker ps -aq)

docker rm $(docker ps -aq)

docker rmi $(docker images -aq)

rm -rf /vol1/1000/*/
