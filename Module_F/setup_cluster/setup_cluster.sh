#!/usr/bin/env bash



docker stop cluster-server

docker container rm cluster-server -f

docker image rm cluster-server -f

rm -f clusterkey*

ssh-keygen -f ./clusterkey -t rsa -N ''

docker build -t cluster-server --build-arg ssh_pub_key="$(cat ./clusterkey.pub)" .

sleep 2

for i in $(seq 1 1 20)
do
docker run -i -t -d --name cluster-server-${i} cluster-server
docker exec -it cluster-server netstat -anp
docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' cluster-server
done

# ssh -o "StrictHostKeyChecking no" -i clusterkey root@$(docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' cluster-server)

