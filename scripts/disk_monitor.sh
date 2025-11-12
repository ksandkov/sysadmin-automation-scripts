#!/usr/bin/env bash
set -euo pipefail
LOG_FILE="/var/log/disk_monitor.log"
THRESHOLD=80
LOG_DIR=$(dirname "$LOG_FILE")
if [ ! -d "$LOG_DIR" ]; then mkdir -p "$LOG_DIR"; fi
if [ ! -f "$LOG_FILE" ]; then touch "$LOG_FILE"; fi
echo "[$(date '+