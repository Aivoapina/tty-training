#!/usr/bin/sh
docker run -d --name mongo -p 91:27017 -p 92:28017 mongo:3 mongod --rest
docker build . --tag frontimage
docker run -d --name frontend -p 80:80 frontimage
docker swarm init --advertise-addr 127.0.0.1

