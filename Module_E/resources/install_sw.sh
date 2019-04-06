#!/usr/bin/env bash

sudo yum install wget -y

wget -O /tmp/ruby.tar.gz https://cache.ruby-lang.org/pub/ruby/2.6/ruby-2.6.2.tar.gz

cd /tmp

tar -xzf ruby.tar.gz

cd /tmp/ruby-2.6.2


bash configure
make
sudo make install