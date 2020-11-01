#!/bin/bash

touch script5.txt

count=0
sum=0

prev_PID="name"
grep_PID="Parent_ProcessID=[0-9]\{1,\}"
average="Average_Running_Time=[0-9\.]\{1,\}"
len_parentPID=17
len_average=21

while read i
do
	fieldParent=$(echo "$i" | grep -o "$grep_PID")
	parentPID="${fieldParent:len_parentPID}"
	fieldAverage=$(echo "$i" | grep -o "$average")
	AV="${fieldAverage:len_average}"
	if [[ ($prev_PID == $parent_PID) ]]; then
		let count="$count + 1"
		sum=$(echo "$sum + $AV" | bc -l)
	else 
		if [[ (count -ne "0") ]]; then
			echo -n "Average_Sleeping_Children_of_ParentID=$prev_PID is " >> script5.txt
			echo "$sum / $count" | bc -l >> script5.txt
		fi
		count=1
		sum="$AV"
	fi
	echo "$i" >> script5.txt
	prev_PID="$parentPID"
done < script4.txt
echo -n "Average_Sleeping_Children_of_ParentID=$parentPID is " >> script5.txt
echo "$sum / $count" | bc -l >> script5.txt
cat script5.txt > script4.txt
rm script5.txt
		
