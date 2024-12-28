#!/bin/bash
#Purpose: Monitoring disk space utilization and sending email alerts
#Version: 1.0
#Created Date: Sat Dec 28 06:10:20 AM IST 2024
#Modified Date: 
#Author: Harsha
# Start #

THRESHOLD=40                            # Disk usage threshold percentage
mailTo="root"                           # Recipient email address
HOSTNAME=$(hostname)                    # System hostname
TEMPFILE="/tmp/disk_usage_alert.txt"    # Temporary file to store alert details

# Clean the temporary file if it exists
rm -f $TEMPFILE

# Check each disk's usage
for usage in $(/bin/df -h | grep -vE 'Filesystem|tmpfs' | awk '{print $5}' | sed 's/%//g'); do
    if [ "$usage" -ge "$THRESHOLD" ]; then
        /bin/df -h | grep "$usage%" >> $TEMPFILE
    fi
done

# Send email alert if any usage exceeds the threshold
if [ -s $TEMPFILE ]; then
    mail -s "$HOSTNAME Disk Usage Alert: Critical" $mailTo < $TEMPFILE
    echo "Disk usage alert sent to $mailTo"
else
    echo "No disk usage exceeds the threshold of $THRESHOLD%"
fi

# Clean up the temporary file
rm -f $TEMPFILE

# END #

