#!/usr/bin/env bash

docker stop cluster-server
rm -f clusterkey*
docker system prune -af

ssh-keygen -f ./clusterkey -t rsa -N ''
docker build -t cluster-server --build-arg ssh_pub_key="$(cat ./clusterkey.pub)" .


docker run -i -t -d --name cluster-server cluster-server


docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' cluster-server
ssh -i clusterkey root@$(docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' cluster-server)