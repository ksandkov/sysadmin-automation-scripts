# System Administration Automation Scripts

A collection of lightweight, production-ready Bash scripts for system monitoring, log rotation, and basic server maintenance.

## Scripts Overview

### 1. `disk_monitor.sh`
Checks space on the root (`/`) partition and appends an alert to `/var/log/disk_monitor.log` if usage exceeds the threshold (default: 80%).

**Manual Execution:**
```bash
./scripts/disk_monitor.sh
```

### 2. `log_cleaner.sh`
Safely finds and deletes log files (`*.log`) older than a specified number of days in a target directory to prevent disk saturation.

**Manual Execution:**
```bash
# Usage: ./log_cleaner.sh <TARGET_DIRECTORY> <DAYS>

# Clean Nginx logs older than 14 days
./scripts/log_cleaner.sh /var/log/nginx 14

# Run with defaults (/var/log/app and 7 days)
./scripts/log_cleaner.sh
```

## Cron Automation Setup

To automate these maintenance tasks, add the following jobs to your crontab (`crontab -e`):

```cron
# Run disk space monitoring every hour
0 * * * * /bin/bash /path/to/sysadmin-automation-scripts/scripts/disk_monitor.sh > /dev/null 2>&1

# Run log cleanup every day at 03:00 AM for /var/log/app (files older than 7 days)
0 3 * * * /bin/bash /path/to/sysadmin-automation-scripts/scripts/log_cleaner.sh /var/log/app 7 > /dev/null 2>&1
```
