#!/bin/bash

date

if [ $? -eq 0 ]; then # $?=last executed command, -eq=equalto, 0=represents success
    echo "date printed successfully"
else
    echo "please check your command"
fi
