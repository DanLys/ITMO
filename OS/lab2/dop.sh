#!bin/bash

dir="/proc"
pid=$1

while [ ! -z "$pid" ];
do
	if [ -e "$dir/$pid" ];
	then
		pid=$(cat "$dir/$pid/status" | grep "PPid" | cut -f 2)
		echo $pid
	else 
		break
	fi
done
