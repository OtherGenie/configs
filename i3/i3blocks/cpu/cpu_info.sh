#!/bin/bash

# # Get CPU load percentage
# cpu_load=$(top -bn1 | grep "Cpu(s)" | awk '{print 100 - $8"%"}')

# Get CPU temperature (requires lm-sensors)
if command -v sensors &>/dev/null; then
  cpu_temp=$(sensors | grep 'Package id 0' | awk '{print $4}')
else
  cpu_temp="N/A"
fi

# Output for i3blocks
echo "🌡 $cpu_temp"
