#!/usr/bin/sh
docker stop *
docker rm *
docker run -d --name mongo -p 91:27017 -p 92:28017 mongo:3 mongod --rest
docker build ./frontend/ --tag frontimage
docker run -d --name frontend -p 80:80 frontimage
#docker swarm init --advertise-addr 127.0.0.1
docker build ./logstash/ --tag logstashimage
docker build ./haproxy/ --tag haproxyimage
docker run -d --name logstash -p 8002:8002 logstashimage
docker run -d --name haproxy -p 8001:8001 haproxyimage
