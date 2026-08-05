#!/bin/bash
#This script list down files in a directory.



FILES=(/c/Users/jawai/devops/Linux-for-devops/shell_scripting/day04/*.sh)

if [ ! -e "${FILES[0]}" ]; then
    echo "$FILES does not exist or missing"
    exit 1
fi

for file in "${FILES[@]}"
do
    echo "$file"

done 