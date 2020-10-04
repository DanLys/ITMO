#/bin/bash

touch full.log
dir=/var/log/system.log

res=$(sed 's/INFO/Information:/g; s/WARNING:/Warning:/g' $dir)
grep -Ewo "Warning:" <<< $res > full.log
grep -Ewo "Information:" <<< $res > full.log
