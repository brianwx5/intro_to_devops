#!/usr/bin/env bash
for ip_address in $(cat ./manage_list.txt)
do
echo "$ip_address"
ssh -o "StrictHostKeyChecking no" -i clusterkey root@$ip_address 'ps -ef'
done