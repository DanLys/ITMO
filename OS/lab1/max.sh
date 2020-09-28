#!bin/bash
read x y z

if [ "$x" -ge "$y" -a "$x" -ge "$z" ]; then
    echo "$x"
elif [ "$y" -ge "$x" -a "$y" -ge "$z" ]; then
    echo "$y"
else echo "$z"
fi
