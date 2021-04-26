#!/bin/bash
#NETWORK
docker network create --driver bridge minharede

#DB
docker run --rm -d --network minharede --name mysql brunoapiou/mysql_pfa

#BACK-END
docker run --rm -d --network minharede --name myapp brunoapiou/app_pfa

#NGINX
docker run --rm -d --network minharede --name mynginx -p 8080:8080 brunoapiou/nginx_pfa