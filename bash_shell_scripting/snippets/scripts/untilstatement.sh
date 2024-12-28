#!/bin/bash
#Purpose : Until Loop Example for host ping 
#Version:1.0
#Created Date: Sat Dec 28 05:29:32 AM IST 2024
#Modified Date:
#Author: Harsha
# Start #
echo -e "Please enter the IP address to Ping: \c"
read -r ip 
until ping -c 3 $ip 
do 
    echo "Host $ip is Still Down"
    sleep 1
done 
echo "Host $ip is Up Now"
# END #
