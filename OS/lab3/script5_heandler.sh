#!/bin/bash
ans=1
oper="+"
check='^[0-9]+$'
(tail -f pipe) |
	while true; do
		read LINE
		if [[ $LINE = "QUIT" ]]; then
			echo "ans = $ans"
			echo "exit"
			killall script5_generator.sh
			exit
		fi
		if [[ $LINE =~ $check ]]; then
			if [[ $oper = "+" ]]; then
				let ans=$ans+$LINE
			else
				let ans=$ans*$LINE
			fi
		else
			if [[ "$LINE" = "+" || "$LINE" = "*" ]]; then
				oper=$LINE
			else
				echo "Error"
				killall script5_generator.sh
				exit
			fi
		fi
		echo $ans
	done			




