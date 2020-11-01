#!bin/bash
touch script1.txt

ps | wc -l >> script1.txt
ps | awk -F ' ' '{ print $1 " " $4 }' >> script1.txt

