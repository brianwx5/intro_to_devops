#!/usr/bin/env bash
for ip_address in $(cat /tmp/host.txt)
do
echo "$ip_address"
ssh -o "StrictHostKeyChecking no" -i clusterkey root@$ip_address 'ps -ef'
done