#!/bin/bash
USAGE=$(df -H / | tail -n 1 | awk '{print $5}' | tr -d %)
if [ "$USAGE" -gt 80 ]; then
    echo "Disk space critical!" >> /var/log/disk.log
fi
