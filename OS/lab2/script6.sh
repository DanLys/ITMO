#!/bin/bash

dir="/proc/*"

for process in $dir;
do 
	pid=${process:6}
	num="^[0-9]+$"
	if ! [[ $pid =~ $num ]]; then
		continue
	fi
	res="$(awk '$1=="VmSize:"  { print $2 }' $process/status)"
	echo "$pid $res"
done | sort -g -k2 | tail -1
