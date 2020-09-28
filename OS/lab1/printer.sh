#!bin/bash

result=""

while [ true ]
do
    read reader
    if [ "$reader" == "q" ]; then
        break;
    fi
    result+="$reader"
done

echo "$result"
