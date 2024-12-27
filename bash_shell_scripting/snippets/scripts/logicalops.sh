#!/bin/bash
#Purpose : Logical operators/Boolean Operators. Student marks validation
#Version: 1.0
#Created Date: Fri Dec 27 07:01:57 PM IST 2024
#Modified Date:
#Author: Harsha
# Start #
echo "Enter your maths subject marks: \c"
read -r m

echo "Enter your physics subject marks: \c"
read -r p

echo "Enter your chemistry subject marks: \c"
read -r c

if test $m -ge 35 -a $p -ge 35 -a $c -ge 35
then
echo "Congratulations, you have passed in all subjects"
else 
echo "Sorry, You cannot proceed further" 
fi

# END #
