#!/bin/bash
#Purpose : Internal field seperator
#Version:1.0
#Created Date: Sat Dec 28 06:34:03 AM IST 2024
#Modified Date:
#Author: Harsha
# Start #
LINE=`cat /etc/passwd | grep $1`
IFS=:
set $LINE
echo "User Name = $1"
echo "Password = $2"
echo "UID = $3"
echo "GID = $4"
echo "Description = $5"
echo "Home Directory = $6"
echo "Current Shell = $7"

# END #
