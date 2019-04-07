#!/usr/bin/env bash

cd /tmp

which go > /dev/null 2>&1

if [ $? -ne 0 ]; then

    echo "Go Lang is not installed, please try again!"

    exit 1

fi

echo "Go Lang is installed!"