#!/bin/bash
#Purpose : Verifying difference between quotation marks 
#Version:1.0
#Created Date: Fri Dec 27 05:15:29 PM IST 2024
#Modified Date:
#Author: Harsha
# Start #


#no space in between these
VAR1=123456
TEST1=Harsha

# Double quotes
echo "Execute double quotes $VAR1 $TEST1"

# Single quotes 
echo 'Execute single quotes $VAR1 $TEST1'

# Reverse quotes
echo "This Hostname is `hostname`"

# END #

