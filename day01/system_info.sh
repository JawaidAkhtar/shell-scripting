#/bin/bash

# This script displays system information including OS details,
# User information, ip, date and uptime.

echo "current loggedin user: $(whoami)"
echo "Operating System details: $(uname -a)"
echo "Hostname: $(hostname)"
echo "IP Address: $(hostname -I | awk '{print $1}')"
echo "current date and time: $(date)"
