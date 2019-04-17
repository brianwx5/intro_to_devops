#!/usr/bin/env bash

rm -f ./manage_list.txt

docker stop $(docker ps -a --filter="name=cluster-" | awk 'FNR > 1 {print $1}')

docker container rm $(docker ps -a --filter="name=cluster-" | awk 'FNR > 1 {print $1}') -f

docker image rm cluster-server -f

rm -f clusterkey*

ssh-keygen -f ./clusterkey -t rsa -N ''

docker build -t cluster-server --build-arg ssh_pub_key="$(cat ./clusterkey.pub)"  --build-arg ssh_prv_key="$(cat ./clusterkey)" .

sleep 2

for i in $(seq 1 1 20)
do
if [[ ${i} == 1 ]]; then
docker run -i -t -d --name cluster-master cluster-server
docker exec -it cluster-master netstat -anp
docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' cluster-master
else
docker run -i -t -d --name cluster-server-${i} cluster-server
docker exec -it cluster-server-${i} netstat -anp
docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' cluster-server-${i} >> ./manage_list.txt
fi
done


docker cp manage_list.txt cluster-master:/opt/ansible/launchpad/host.txt

docker cp ansible-playbook.yml cluster-master:/opt/ansible/launchpad/ansible-playbook.yml

docker cp motd.j2 cluster-master:/opt/ansible/launchpad/motd.j2

# time ansible-playbook /opt/ansible/launchpad/ansible-playbook.yml -i /opt/ansible/launchpad/host.txt
# ansible -m setup hostname
# docker exec -it cluster-master /bin/sh -c "time ansible-playbook /opt/ansible/launchpad/ansible-playbook.yml -i /opt/ansible/launchpad/host.txt"
# for i in $(seq 1 1 20)
# do
# done
# ssh -o "StrictHostKeyChecking no" -i clusterkey root@$(docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' cluster-server)

