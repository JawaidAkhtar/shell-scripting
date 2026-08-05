#!/bin/bash


USERNAME=$1

if [ -n "$USERNAME" ]; then  #-n checks the argument is not empty( -n means not empty string) 
    
    echo "username provided: $USERNAME"

else
    echo "username is missing"
fi