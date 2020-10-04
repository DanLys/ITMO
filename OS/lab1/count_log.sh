#!/bin/bash

dir="/var/log/*.log"
wc -l $dir | tail -n1 | awk '{print $1}'
