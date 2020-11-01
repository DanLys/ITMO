#!bin/bash

ps aux | awk -F ' ' '{ print $2 " " $10 }' | tail -n +2 | head -2 | sort -k9 | tail -1 | awk '{ print $1 }'
