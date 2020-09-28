#/bin/bash

touch info.log

input=/var/log/system.log
while read line;
do
    awk -v word="$1" line
    if [[ "$word" == *"INFO"* ]]; then
        echo "$line" >> info.log
    fi;
done < "$input"
< info.log
