#!/bin/bash

dir=/etc/passwd

cat $dir | awk -F ":" '{print $3}' | sort -n
