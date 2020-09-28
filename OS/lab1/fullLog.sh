#/bin/bash

touch full.log

ls /var/log/*.log | xargs cat
