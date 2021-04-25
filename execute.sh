#!/bin/bash
#NETWORK
docker network create --driver bridge minharede

#DB
cd db

docker build -t mysql_image .
docker run --rm -d --network minharede --name mysql mysql_image
cd ..

#BACK-END
cd app

docker build -t myapp_image .
docker run --rm -d --network minharede --name myapp -p 5000:5000 myapp_image
cd ..

#NGINX
cd web

docker build -t mynginx_image .
docker run --rm -d --network minharede --name mynginx -p 8080:8080 mynginx_image