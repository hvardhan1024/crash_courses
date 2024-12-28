#!/bin/bash
#Purpose : Array example
#Version:1.0
#Created Date: Sat Dec 28 05:36:47 AM IST 2024
#Modified Date:
#Author: Harsha
# Start #
fruits=( "Apple" "Orange" "Banana" "Sapota" )
fruits[3]="Green Apple"
for fruit in ${fruits[@]}
do echo "Fruit Name is $fruit"
done 
echo "Number of Fruits in the basket is " ${#fruits}
echo "All Fruits ${fruits[@]}"
# END #
