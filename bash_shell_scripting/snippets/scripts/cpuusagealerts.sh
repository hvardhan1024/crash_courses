#!/bin/bash
#Purpose: Monitor CPU utilization and send alerts based on thresholds
#Version: 1.0
#Created Date: Sat Dec 28 05:46:45 AM IST 2024
#Modified Date: 
#Author: Harsha
# Start #

# Set paths and configurations
HOSTNAME=$(hostname)                   # Get the hostname of the system
CRITICAL=98                            # Critical CPU usage threshold
WARNING=90                             # Warning CPU usage threshold
CRITICALMail="mail@yahoo.com"          # Email for critical alerts
MAILWAR="Youremail@domain.in"          # Email for warning alerts
LOGDIR="/var/log/cputilhist"           # Directory for log files
LOGFILE="$LOGDIR/cpusage-$(date +%h%d%y).log"  # Log file path with a timestamp

# Create the log directory if it doesn't exist
mkdir -p "$LOGDIR"

# Create the log file if it doesn't exist
touch "$LOGFILE"

# Monitor CPU utilization
while true; do
    # Fetch CPU load using the `top` command
    CPULOAD=$(top -b -n 1 | grep "Cpu(s)" | awk '{print $2}' | awk -F. '{print $1}')

    # Validate CPU load thresholds and send alerts
    if [ -n "$WARNING" ] && [ -n "$CRITICAL" ]; then
        if [ "$CPULOAD" -ge "$WARNING" ] && [ "$CPULOAD" -lt "$CRITICAL" ]; then
            # Log warning message
            echo "$(date "+%F %H:%M:%S") WARNING - CPU Load: $CPULOAD% on Host: $HOSTNAME" >> "$LOGFILE"
            
            # Send warning email
            echo "Warning: CPU Load $CPULOAD% on Host $HOSTNAME" | mail -s "CPU Load Warning" "$MAILWAR"
        elif [ "$CPULOAD" -ge "$CRITICAL" ]; then
            # Log critical message
            echo "$(date "+%F %H:%M:%S") CRITICAL - CPU Load: $CPULOAD% on Host: $HOSTNAME" >> "$LOGFILE"
            
            # Send critical email
            echo "Critical: CPU Load $CPULOAD% on Host $HOSTNAME" | mail -s "CPU Load Critical" "$CRITICALMail"
        fi
    fi

    # Wait for 60 seconds before the next check
    sleep 60
done

# END #

