#!/usr/bin/env bash
set -euo pipefail
TARGET_DIR="${1:-/var/log/app}"
DAYS="${2:-7}"
if [ ! -d "$TARGET_DIR" ]; then exit 1; fi
find "$TARGET_DIR" -type f -name "*.log" -mtime +"$DAYS" -exec rm -f {} \;
