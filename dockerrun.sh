#!/usr/bin/sh
docker stop frontend haproxy logstash mongo
docker rm frontend haproxy logstash mongo
docker build ./frontend --tag frontimage
docker build ./haproxy --tag haproxy
docker build ./logstash --tag logstash
docker run -d --name mongo -p 91:27017 -p 92:28017 mongo:3 mongod --rest
docker run -d --name frontend -p 8080:80 frontimage
docker run -d --name haproxy -p 80:80 haproxy
docker run -d --name logstash -p 2000:2000 logstash
#docker swarm init --advertise-addr 127.0.0.1

