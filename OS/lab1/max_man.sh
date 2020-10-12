#!/bin/bash
man bash | grep -Ewo "[[:alpha:]_]{4,}" | sort |  uniq -c | sort -nr -k1 | awk '{print $2}' | head -n 3
