#!/bin/bash

# Get the IP address (IPv4) of the default network interface (eth0 or wlan0)
ip_address=$(hostname -I | awk '{print $1}')

# If no IP address is found, use "No IP"
if [ -z "$ip_address" ]; then
  ip_address="No IP"
fi

# Output the IP address
echo "$ip_address"
