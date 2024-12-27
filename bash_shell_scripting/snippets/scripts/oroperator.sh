#!/bin/bash
#Purpose : Logical operators/Boolean Operators. Student marks validation
#Version: 1.0
#Created Date: Fri Dec 27 07:01:57 PM IST 2024
#Modified Date:
#Author: Harsha
# Start #
echo "Enter your first value: \c"
read -r t

echo "Enter your second value: \c"
read -r b


if [ $t -le 20 -o $b -ge 30 ]; then
echo "The statement is true"
else 
echo "False, Statement try again" 
fi

# END #
