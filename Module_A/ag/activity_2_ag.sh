#!/usr/bin/env bash

sudo id -u johnny

if [ $? -ne 0 ]; then

    echo "User Johnny has not been created!"

    exit 1

fi

sudo getent group testing

if [ $? -ne 0 ]; then

    echo "Testing group has not been created!"

    exit 1

fi