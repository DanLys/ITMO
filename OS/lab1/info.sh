#/bin/bash

touch info.log

input=/var/log/system.log

awk '$2 == "INFO" {print$0}' $input > info.log
