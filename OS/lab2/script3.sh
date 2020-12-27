#!bin/bash

ps -eo pid,ppid,time --no-headers | awk -v pid=$$ ' $2 != pid {print $1}' | tail -n 1
