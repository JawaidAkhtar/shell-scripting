#!/bin/bash
#This script take argument in function.

check_user() {
    echo "User: $1 is available"
}

if [ "$#" -ne 1 ]; then
    echo "USAGE: $0 username"
    exit 1
fi

check_user "$1"