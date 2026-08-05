#!/bin/bash
#This script shows usage of array in bash script.

SERVERS=("www.google.com" "www.github.com" "www.gitlab.com" "www.xyz.com")

for server in "${SERVERS[@]}"
do
    if ping $server > /dev/null 2>&1; then
        echo "$server is reachable..."
    else
        echo "$server is not reachable..."
    fi
done