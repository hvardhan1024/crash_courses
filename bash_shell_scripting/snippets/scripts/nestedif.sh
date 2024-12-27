#!/bin/bash
#Purpose : ifelse2 statement
#Version:1.0
#Created Date: Fri Dec 27 07:29:07 PM IST 2024
#Modified Date:
#Author: Harsha
# Start #

echo -e "Enter the four numbers seperated by space: \c"
read -r a
read -r b
read -r c
read -r d

if [ $a -gt $b -a $a -gt $c -a $a -gt $d ]; then
echo "$a is the greatest number"

elif [  $b -gt $c -a $b -gt $d ]; then
echo "$b is the greatest number"

elif [ $c -gt $d ]; then
echo "$c is the greatest number"

else
echo "$d is the greatest number"

fi
# END #
