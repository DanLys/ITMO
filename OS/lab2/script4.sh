#!bin/bash

dir="/proc/*"
touch script4.txt

for process in $dir;
do
	pid=${process:6}
	number="[0-9]+$"
	if ! [[ "$pid" =~ $number ]]; then
		continue
	fi
	ppid="$(awk '$1=="PPid:" { print $2 }' $process/status)"
	sum="$(awk '$1=="se.sum_exec_runtime" { print $3 }' $process/sched)"
	nr="$(awk '$1=="nr_switches" { print $3 }' $process/sched)"
	echo -n "$pid $ppid "
	echo "$sum / $nr" | bc -l
done | sort -gk 2 | awk '{ printf("ProcessId=%s : Parent_ProcessID=%s : Average_Running_Time=%s\n", $1, $2, $3) }' > script4.txt
