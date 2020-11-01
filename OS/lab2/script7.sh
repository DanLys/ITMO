#!/bin/bash

dir="$(ps aux | tail -n +2)"

echo "$dir" | awk 'NR>1 { tmp=""; for(i=11; i<=NF; i++) tmp=tmp" "$i; printf("%s %s\n", $2, tmp) }' > processes

while read i; 
do
	PID=$(echo "$i" | awk '{ print $1 }')
	if [ -d "/proc/$PID" ]; then
		tmp=$(sudo grep "read_bytes: " "/proc/$PID/io")
		bytes=${tmp:12}
		echo -n "$bytes " » hdata
		echo "$i" » hdata
	fi
done < processes
rm processes

sleep 60s

while read i; 
do
	PID=$(echo "$i" | awk '{ print $2 }')
	old_bytes=$(echo "$i" | awk '{ print $1 }')
	if [ -d "/proc/$PID" ]; then
		tmp=$(sudo grep "read_bytes: " "/proc/$PID/io")
		bytes=${tmp:12}
		let diff="$bytes - $old_bytes"
		echo -n "$diff" » hdata2
		echo "$i" » hdata2
	fi
done < hdata
rm hdata
sort -r -k1 hdata2 | head -3 | awk '{ tmp=""; for(i=3; i<=NF; i++) tmp=tmp" "$i; printf("%s:%s:%s\n", $2, $1, tmp) }'
rm hdata2
