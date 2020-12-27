#!bin/bash

dateNow=$(date +'%Y-%m-%d')
lastDir=~/$(ls $HOME | egrep "^Backup-" | sort -n | tail -1)

if [ ! -d ~/restore ]; then
	mkdir ~/restore	
fi

#echo $lastDir
for el in $(ls $lastDir)
do
	if ! grep "*.[0-9]{4}-[0-9]{2}-[0-9]{2}" <<< "$el"; then
		cp -a $lastDir/$el ~/restore
	fi
done
