#!/bin/bash

# Gather system information using commands
HOSTNAME=$(hostname)
IP_ADDRESS=$(hostname -I)
MEMORY=$(free -h | awk '/Mem/ {print $2}')
CPU=$(grep "model name" /proc/cpuinfo | head -n 1 | cut -d ':' -f 2)

# Print gathered system information
echo "Hostname: $HOSTNAME"
echo "IP Address: $IP_ADDRESS"
echo "Memory: $MEMORY"
echo "CPU: $CPU"
