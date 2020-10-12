#!bin/bash

if [[ $2 -ge $1  && $2 -ge $3 ]]
then
    echo $2
elif [[ $3 -ge $1 && $3 -ge $2 ]]
    then
        echo $3
else
    echo $1
fi
