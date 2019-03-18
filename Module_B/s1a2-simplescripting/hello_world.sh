#!/bin/bash

bound=$1

i=0

while [ $i -lt $bound ]; do
	echo "Hello World!"
        let i=i+1
done
