#!bin/bash

touch emails.lst

sudo grep -Ewo '[[:alnum:]_-]+@[[:alnum:]]+\.[[:alpha:]]+' -r /etc -h > emails.lst
