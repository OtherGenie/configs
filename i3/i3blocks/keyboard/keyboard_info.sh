#!/bin/bash

# layout=$(setxkbmap -query | grep layout | awk '{print $2}' | head -n 1)
layout=$(xset -q | grep LED | awk '{ print ($10==00000000) ? "us" : ($10=="00001000") ? "ge" : "de" }')

# Output for i3blocks
echo "$layout"
