#!/bin/bash
#Purpose : Function example. Taking Backup of Particular file
#Version:1.0
#Created Date: Sat Dec 28 05:23:15 AM IST 2024
#Modified Date:
#Author: Harsha
# Start #

function takebackup (){
    if [ -f $1 ]; then
    BACKUP="/opt/$(basename ${1}).$(date +%F).$$"
    echo "Backing up $1 to ${BACKUP}"
    cp $1 $BACKUP
    fi
}

takebackup ~/Desktop/temp.html
    if [ $? -eq 0 ]; then 
    echo "Backup Success"
    fi
# END #
