#!/usr/bin/env bash

# Wow you followed the Pro Tip

sudo yum install wget -y

wget -O /tmp/go.tar.gz https://dl.google.com/go/go1.10.3.linux-amd64.tar.gz

cd /tmp

tar -C /opt -xzf go.tar.gz

ln /opt/go/bin/go /bin/go

export PATH=$PATH:/bin/go

which go

if [ $? -ne 0 ]; then

    echo "GO install fail."

fi


echo "Go Installed."