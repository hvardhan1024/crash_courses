#!/bin/bash
#Purpose : While loop table
#Version:1.0
#Created Date: Fri Dec 27 09:15:20 PM IST 2024
#Modified Date:
#Author: Harsha
# Start #

echo -e "Please enter one value : \c"
read -r c
i=1
while [ $i -le 10 ]
do 
b=`expr $c \* $i`
echo "$c * $i = $b"
i=`expr $i + 1`
done
# END #
