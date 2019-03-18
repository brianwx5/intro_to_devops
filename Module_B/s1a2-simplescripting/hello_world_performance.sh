#!/usr/bin/env bash

bash_script=$1
python_script=$2

if [ -f ./performance_output.txt ]; then

  rm -f ./performance_output.txt

fi

echo "------------------------------"
echo "Executing Bash Script"
time bash $bash_script 10000 > ./performance_output.txt
echo "------------------------------"

echo "------------------------------"
echo "Executing Python Script"
time python $python_script 10000 >> ./performance_output.txt
echo "------------------------------"
