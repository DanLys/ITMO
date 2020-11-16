#!/bin/bash

touch res.sh
dir="test.sh"

grep -E '^#!/bin/bash$|^[^#]' $dir > res.sh
