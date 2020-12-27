#!bin/bash

dateNow=$(date +'%Y-%m-%d')
lastDir=~/$(ls $HOME | egrep "^Backup-" | sort -n | tail -1)
last=$(ls $HOME | egrep "^Backup-" | sort -n | tail -1 | cut -d "-" -f 2,3,4)
let diff=($(date -d "$dateNow" +%s)-$(date -d "$last" +%s))/86400
  
if [ 7 -lt $diff ];
then
	mkdir ~/Backup-$dateNow
  	echo "New backup, ""$dateNow" >> ~/backup-report
  	for el in $(ls ~/source)
  	do
     		cp -a ~/source/$el ~/Backup-$dateNow/$el
     		echo "$el" >> ~/backup-report
  	done
else 
	echo "Added ""$dateNow" >> ~/backup-report
  	echo "INFO: " >> ~/backup-report
  	for el in $(ls ~/source)
  	do
     		if [ ! -f "$lastDir"/"$el" ];
     		then
       		cp -a ~/source/$el $lastDir/$el
       		echo "Copy "~/source/"$el"" to ""$lastDir"/"$el" >> ~/backup-report
     		else
       		mem1=$(wc -c $lastDir/$el | awk '{print $1}')
       		mem2=$(wc -c ~/source/$el | awk '{print $1}')
       		if [ $mem1 -ne $mem2 ];
       		then
         			date=$(date +'%Y-%m-%d-%H-%M-%S')
         			mv $lastDir/$el $lastDir/$el.$date
         			cp -a ~/source/$el $lastDir/$el
         			echo "Copy: ""$lastDir"/"$el"" and ""$lastDir"/"$el"".""$date" >> ~/backup-report
       		fi
    		 fi
  	done
fi
