#!/bin/bash

df -h /home | awk '/\//{ printf("  %4s/%s \n", $4, $2) }'
