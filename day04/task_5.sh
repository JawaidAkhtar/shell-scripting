#!/bin/bash
#This script retry the attempt.


COUNT=1

while [ "$COUNT" -le 10 ]
do
    echo "Atempt= $COUNT"
    sleep 1
    COUNT=$((COUNT + 1))
done