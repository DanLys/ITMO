#/bin/bash

touch full.log
dir=logs.log

res=$(sed -e 's/INFO/Information:/g; s/WARNING:/Warning:/g' $dir)
echo "$res" | grep " WARNING " >> full.log
echo "$res" | grep " Information: " >> full.log
