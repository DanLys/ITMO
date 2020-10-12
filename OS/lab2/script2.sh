#!bin/bash
touch script2.txt
ps aux | grep "/sbin/" | awk -F ' ' '{print $2}' >> script2.txt
