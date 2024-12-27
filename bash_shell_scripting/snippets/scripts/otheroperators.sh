#!/bin/bash
#Purpose : Logical operators/Boolean Operators. Student marks validation
#Version: 1.0
#Created Date: Fri Dec 27 07:01:57 PM IST 2024
#Modified Date:
#Author: Harsha
# Start #
if [[ $1 -lt 20 || $2 -ge 30 ]];then
echo "Statement is true"
else 
echo "Staement is false"
fi

# END #
