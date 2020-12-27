#!bin/bash
	
logs=$(cat ~/.trash.log)
#echo "" > ~/.trash.log

for LINE in $logs
do
	nameTo=$(echo "$LINE" | awk -F':' '{print $1}')
	nameFrom=$(echo "$LINE" | awk -F':' '{print $2":"$3":"$4}')
	#echo "======"
	#echo $LINE
	#echo $nameTo
	#echo $nameFrom
	#echo $1
	#echo "%%%%%%"
	if grep -q "$1" <<< "$nameTo"; then
		echo "This ""$nameTo""? y/n"
		read answ <&1
		if [ "$answ" == "y" ]; then
			dir=$(echo "$nameTo" | awk -F/ 'OFS="/"{$NF="" ; print $0}')
			#echo $dir
			if [ ! -d "$dir" ]; then
				echo "Directory not found"
				dir="~/"
			fi
			
			rec=~/.trash/
			rec="$rec""$nameFrom"
			newName="$dir""$1"
			#echo "$rec"
			#echo $newName
			
			if [ -f "$1" ]; then
				echo "Write new file name = "
				read newShortName <&1
				newName="$dir""$newShortName"
			fi
			
	
			if [ -f "$rec" ]; then
				ln "$rec" "$newName"
			fi
		fi
	fi
done < ~/.trash.log
