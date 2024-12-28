#!/bin/bash
#Purpose : Getopts examples working with arguments
#Version:1.0
#Created Date: Sat Dec 28 05:42:00 AM IST 2024
#Modified Date:
#Author: Harsha
# Start #

while getopts :a:b: options; do 
    case $options in 
        a) ap=$OPTARG;;
        b) bo=$OPTARG;;
        ?) echo "I dont know what is $OPTARG is "
    esac
done 
echo "Option A = $ap and Option B = $bo"
# END #
