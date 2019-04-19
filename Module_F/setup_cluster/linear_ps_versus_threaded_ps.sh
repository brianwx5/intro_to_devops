#!/usr/bin/env bash

bash_script=./linear_ps.sh
python_script=./multithread_config.py

if [ -f ./performance_output.txt ]; then

  rm -f ./performance_output.txt

fi

echo "------------------------------"
echo "Executing Bash Script"
time bash $bash_script > ./performance_output.txt
echo "------------------------------"

echo "------------------------------"
echo "Executing Python Script"
time python3.6 $python_script 10000 >> ./performance_output.txt
echo "------------------------------"
