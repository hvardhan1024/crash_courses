#!/bin/bash
#Purpose : Shifting positional parameters automatically
#Version:1.0
#Created Date: Sat Dec 28 05:18:53 AM IST 2024
#Modified Date:
#Author: Harsha
# Start #
set `date`
echo "Count $#"
echo "$1 $2 $3 $4 $5"
shift
echo "$1 $2 $3 $4 $5"
shift
echo "$1 $2 $3 $4 $5"
shift 3
echo "$1 $2 $3 $4 $5"
shift 2
echo "$1 $2 $3 $4 $5"
shift 1
# END #
