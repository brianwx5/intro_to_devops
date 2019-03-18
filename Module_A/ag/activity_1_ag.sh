#!/bin/bash

cd /tmp

which tree > /dev/null 2>&1

if [ $? -ne 0 ]; then

    echo "tree is not installed, install tree"

    exit 1

fi


if [ ! -d /tmp/myFolderNew ]; then

    echo "Directory /tmp/myFolderNew not found! Create directory. (Exiting)"

    exit 1

fi

if [ ! -d /tmp/myFolderNew/myFolder ]; then

    echo "Directory /tmp/myFolderNew/myFolder not found! (Potentially Exiting)"

    if [ -d /tmp/myFolder ]; then

        echo "Directory /tmp/myFolder exists, but wasn't moved to /tmp/myFolderNew (Exiting)"

    fi

    exit 1

fi


if [ ! -f /tmp/myFolderNew/myFolder/name.txt ]; then

    echo "/tmp/myFolderNew/myFolder/name.txt not found! (Potentially exiting)."

    if [ -f /tmp/myFolder/name.txt ]; then

        echo "/tmp/myFolder/name.txt exists, but wasn't moved to /tmp/myFolderNew (Exiting)."

    fi

    exit 1

fi


name=$(cat /tmp/myFolderNew/myFolder/name.txt)

echo "($name) you have successfully completed Activity I"