#!/bin/bash

<< comment
The below script prints you system disk usage and memory usage
comment

echo "=================Disk Usage================"

df -h

df -h | grep '/dev/root' 


echo "=================Memory Usage================"

free -h

echo "==================Cpu Usage=================="
htop