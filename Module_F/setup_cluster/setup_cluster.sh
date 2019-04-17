#!/usr/bin/env bash



docker stop cluster-server

docker container rm cluster-server -f

docker image rm cluster-server -f

rm -f clusterkey*

ssh-keygen -f ./clusterkey -t rsa -N ''

docker build -t cluster-server --build-arg ssh_pub_key="$(cat ./clusterkey.pub)" .

sleep 2

docker run -i -t -d --name cluster-server cluster-server

sleep 2

#docker exec -it cluster-server /usr/sbin/sshd && echo "SSHD started"
docker exec -it cluster-server /bin/sh /tmp/start_sshd.sh

docker exec -it cluster-server netstat -anp

docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' cluster-server

ssh -o "StrictHostKeyChecking no" -i clusterkey root@$(docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' cluster-server)

# docker exec -it cluster-server /bin/ash
# docker exec -it cluster-server /usr/sbin/sshd
