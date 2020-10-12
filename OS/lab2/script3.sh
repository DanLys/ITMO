#!bin/bash

ps aux | awk -F ' ' '{print $2 " " $10}' | sort -k2 | head -2 | awk -F ' ' '{print $1}'
