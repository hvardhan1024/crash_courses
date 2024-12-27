#!/bin/bash
#Purpose : Arithmetic Operators
#Version:1.0
#Created Date: Fri Dec 27 06:48:00 PM IST 2024
#Modified Date:
#Author: Harsha
# Start #
echo -e "Please enter some value: \c"
read -r a
echo -e "Please enter another value: \c"
read -r b

echo "a+b value using expr is `expr $a + $b`"
echo "a-b value using expr is `expr $a - $b`"
echo "axb value using expr is `expr $a \* $b`"
echo "a/b value using expr is `expr $a / $b`"
echo "a%b value using expr is `expr $a % $b`"

echo "Completed"
# END #
