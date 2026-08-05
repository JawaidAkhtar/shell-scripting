#!/bin/bash
#This script takes 3 username as argument and creates users.

USERS=("$1" "$2" "$3")

if [ "$#" -ne 3 ]; then
    echo "USAGE: bash $0 user1 user2 user3"
    exit 1
fi



for user in "${USERS[@]}"
do
    echo "Creating $user"
done