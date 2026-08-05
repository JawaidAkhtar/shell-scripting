#!/bin/bash
#This script shows usage of array in bash script.

SERVERS=( "server1" "server2" "server3" )

for SERVER in "${SERVERS[@]}"
do
    echo "$SERVER"
done