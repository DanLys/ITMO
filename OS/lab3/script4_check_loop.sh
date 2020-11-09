#!/bin/bash
old="$(pgrep '^script4_loop.sh$' -o)"
cpulimit -p "$old" -l 10 &
new="$(pgrep '^script4_loop.sh$' -n)"
kill "$new"
