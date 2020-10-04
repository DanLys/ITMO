#!bin/bash

result=""

while [ "$reader" == "q" ]
do
    result+="$reader"
    read reader
done

echo "$result"
