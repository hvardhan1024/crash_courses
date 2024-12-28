
https://www.youtube.com/watch?v=uI-xHPk4tO0


## Scripting VS Programming
Scripting 
- write to automate particular task
- compiling is not required, it uses interpreter
- Does not require cusotmized environments/setup to develop scripts 
Programmnig 
- One Program can do many tasks
- Must compile to execute program 
- Require customized environment to develop and compile code 

## What is Shell Scripting?
shell scripting is the sequence of commands which are bundled in one file and executed 

example sample shell script
#!/bin/bin 
##This is the sample shell script 
mkdir /createdbyscript
touch /createdbyscript/testfile.txt
echo "Testing Script file" > /createdbyscript/testfile.txt

This creates a file under createdbyscript folder named testfile.txt and writes testing scsript file into that 

- used to automate general tasks

## Types of Shell
What is a shell?
- Shell is a program which connects the user interface to the kernel, shell takes input from the user and passes it to the kernel 
- list all shells present is linux "cat /etc/shells"
- top 5 differences between sh and bash shells 
```bash
❯ cat /etc/shells
# /etc/shells: valid login shells
/bin/sh
/usr/bin/sh
/bin/bash
/usr/bin/bash
/bin/rbash
/usr/bin/rbash
/usr/bin/dash
/bin/zsh
/usr/bin/zsh
/usr/bin/zsh

```

- switch to using sh shell using "/bin/sh"
- nologin 
- tcsh (short desc)
- csh (short desc)

## Create Shell Script Template
```bash
 ❯ vi template
❯ nano template
❯ chmod 777 template
❯ sudo mv template /bin/
[sudo] password for harsha:             


```

```bash
# Template 
#!/bin/bash

# Enable debug mode for troubleshooting
set -x

# Prompt user for filename
echo -e "Please provide the filename you want to create: \c"
read -r file

# Ensure $HOME/scripts directory exists
mkdir -p "$HOME/scripts"

# Create a new file with the given filename
touch "$HOME/scripts/$file.sh"

# Write content to the new script file
{
    echo '#!/bin/bash'
    echo '#Purpose :'
    echo '#Version:'
    echo "#Created Date: $(date)"
    echo '#Modified Date:'
    echo '#Author: Harsha'
    echo '# Start #'
    echo '# END #'
} > "$HOME/scripts/$file.sh"

# Make the file executable
chmod +x "$HOME/scripts/$file.sh"

# Confirm file creation
echo "File created at $HOME/scripts/$file.sh"


```

- ensure you have a ~/scripts/ folder created

## Difference between single and double quotes

- Difference between single and double quotes
- in single quotation you cant display or print or use variables
```bash
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



```

```bash
# Output
❯ ./quotation.sh
Execute double quotes 123456 Harsha
Execute single quotes $VAR1 $TEST1
This Hostname is Blaze

```
## Variables 

Variables are used to store values, it can take different values throughout the execution of the program 
Rules for defining the variables in shell scripting 
- - is not supported 
- list the other ones here

```bash
```bash
#!/bin/bash
#Purpose : Variables
#Version: 1.0
#Created Date: Fri Dec 27 05:15:29 PM IST 2024
#Modified Date:
#Author: Harsha
# Start #
A=10
B=23
HOSTNAME=$(hostname)
DATE=`date`
1value=333
False@Var=False
Hyphen-a=WrongValue

echo "Variable A Value: $A"
echo "Variable B Vaule: $B"
echo "Variable HOST value: $HOSTNAME"
echo "Variable DATE value: $DATE"
echo "Wrong Variable value $lvalue"
echo "False @ Variable $False@Var"
echo "hyphen-a Variable Value: $Hyphen-a"

# END #

Output

❯ nano variables.sh
❯ ./variables.sh
./variables.sh: line 12: 1value=333: command not found
./variables.sh: line 13: False@Var=False: command not found
./variables.sh: line 14: Hyphen-a=WrongValue: command not found
Variable A Value: 10
Variable B Vaule: 23
Variable HOST value: Blaze
Variable DATE value: Fri Dec 27 06:28:37 PM IST 2024
Wrong Variable value 
False @ Variable @Var
hyphen-a Variable Value: -a

```



## Special Variables


 ```bash
  $*, $#, $1, $2, $0, "$@", $?, $$ and $!                                        
```

```bash
$* it stores the complete set of positional parameters as a single string
$# It is set to the number of arguments specified
$1 first argument
$2 second argument
$0 name of executed command
"$@" each quoted string treated as a seperate argument
$? exit status of last command
$$ PID of the current shell
$! PID of the last background job
```

```bash
#!/bin/bash
#Purpose : Special variables 
#Version:1.0
#Created Date: Fri Dec 27 05:37:24 PM IST 2024
#Modified Date:
#Author: Harsha
# Start #
echo "'$ *' output is $*"
echo "'$ #' output is $#"
echo "'$ 1' and '$2' output is $1 and $2"
echo "'$ @' output of $@"
echo "'$ ?' output of $?"
echo "'$ $' output of $$"
echo "'$ 1' output of $!"
echo "'$ 0' Your current program name is  $0"


# END #

```

```bash
# Output

❯ ./specialvariables.sh hello my name is 123
'$ *' output is hello my name is 123
'$ #' output is 5
'$ 1' and 'my' output is hello and my
'$ @' output of hello my name is 123
'$ ?' output of 0
'$ $' output of 5370
'$ 1' output of 
'$ 0' Your current program name is  ./specialvariables.sh



```

## Count Given parameters
```bash
❯ cat given_parameters.sh
#!/bin/bash
#Purpose : Count given parameters
#Version:1.0
#Created Date: Fri Dec 27 06:33:50 PM IST 2024
#Modified Date:
#Author: Harsha
# Start #
echo "You have entered $# number of elements"

# END #
❯ ./given_parameters.sh one two three four fiv siz
You have entered 6 number of elements

```

```bash
you can pass * to indicate that you are passing all the files in the current directory as the arguments

❯ ls
given_parameters.sh  quotation.sh  raven.sh  specialvariables.sh  variables.sh
❯ ./given_parameters.sh *
You have entered 5 number of elements


```


Another example 
```bash
❯ cat given_parameters2.sh
#!/bin/bash
#Purpose : Count given parameters
#Version:1.0
#Created Date: Fri Dec 27 06:33:50 PM IST 2024
#Modified Date:
#Author: Harsha
# Start #
if [ $# -lt 1 ];then
echo "program usage is './scriptname.sh' options"
else 
echo "Your program executed successfully"
fi

# END #
❯ ./given_parameters2.sh
program usage is './scriptname.sh' options
❯ ./given_parameters2.sh one two
Your program executed successfully


```

## Arithmetic Operations

```bash 
❯ cat arithmeticoperators.sh
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

echo "a+b value is $(($a+$b))"
echo "a-b value is $(($a-$b))"
echo "axb value is $(($a*$b))"
echo "a/b value is $(($a/$b))"
echo "a%b value is $(($a%$b))"
# END #
❯ ./arithmeticoperators.sh
Please enter some value: 14
Please enter another value: 2
a+b value is 16
a-b value is 12
axb value is 28
a/b value is 7
a%b value is 0

```

```bash
❯ cat arithmeticoperators2.sh
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
❯ ./arithmeticoperators2.sh
Please enter some value: 14
Please enter another value: 2
a+b value using expr is 16
a-b value using expr is 12
axb value using expr is 28
a/b value using expr is 7
a%b value using expr is 0
Completed


```

## Relational Operators

- -lt : less than <
- -le less than or equal to   <=
- -gt greater than  >
- -ge greater than or equal to >=
- -eq equal to =
- - ne not equal !=
```bash
❯ cat relationaloperators.sh
#!/bin/bash
#Purpose : Relational operators
#Version:1.0
#Created Date: Fri Dec 27 06:58:16 PM IST 2024
#Modified Date:
#Author: Harsha
# Start #

echo -e "Please provide one number : \c"
read -r h
echo -e "Please provide second number : \c"
read -r g


test $h -lt $g;echo "$?"
test $h -le $g;echo "$?"
test $h -gt $g;echo "$?"
test $h -ge $g;echo "$?"
test $h -eq $g;echo "$?"
test $h -ne $g;echo "$?"


# END #
❯ ./relationaloperators.sh
Please provide one number : 3
Please provide second number : 3
1
0
1
0
0
1

```



## Logical operators
- To write multiple conditions 
- validate multiple conditions and execute the statement 
- AND (-a) (&&) 
- OR (-o) (||)
- NOT (-n)

chat gpt write the truth table for all of these please 

```bash
❯ cat logicalops.sh
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
❯ ./logicalops.sh
Enter your maths subject marks: \c
35
Enter your physics subject marks: \c
35
Enter your chemistry subject marks: \c
35
Congratulations, you have passed in all subjects
❯ ./logicalops.sh
Enter your maths subject marks: \c
34
Enter your physics subject marks: \c
35
Enter your chemistry subject marks: \c
35
Sorry, You cannot proceed further

```

```bash
                                                                              ─╯
❯ cat oroperator.sh
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
❯ ./oroperator.sh
Enter your first value: \c
20
Enter your second value: \c
30
The statement is true
❯ ./oroperator.sh
Enter your first value: \c
25
Enter your second value: \c
25
False, Statement try again

```

```bash
❯ ./otheroperators.sh 21 22
Staement is false
❯ cat otheroperators.sh
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
❯ ./otheroperators.sh 21 22
Staement is false

```
## If statement



```bash
❯ cat ifcontrol.sh
#!/bin/bash
#Purpose : If Statement example
#Version:1.0
#Created Date: Fri Dec 27 07:23:50 PM IST 2024
#Modified Date:
#Author: Harsha
# Start #

echo -e "Please provide value below ten : \c"
read -r value

# proper spacing
if [ $value -le 10 ]; then 
echo "You provided the value $value"
touch /tmp/test{1..100}.txt
echo "Script completed successfully"
fi
# END #
❯ ./ifcontrol.sh
Please provide value below ten : 4
You provided the value 4
Script completed successfully

```



## If else statement

```bash
❯ cat ifelsestatement.sh
#!/bin/bash
#Purpose : If else statement
#Version:1.0
#Created Date: Fri Dec 27 07:26:55 PM IST 2024
#Modified Date:
#Author: Harsha
# Start #
echo -e "Enter your age"
read -r age

if [ $age -ge 18 ]; then
echo "You can drive!"
else
echo "You cannot drive!"
fi

# END #
❯ ./ifelsestatement.sh
Enter your age
13
You cannot drive!

```


```bash
❯ cat ifelse2.sh
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
❯ ./ifelse2.sh
Enter the four numbers seperated by space: 3
42
1
3
42 is the greatest number


```
## Nested if statement 

```bash

❯ cat nestedifelse.sh
#!/bin/bash
#Purpose : Nested if else 
#Version:1.0
#Created Date: Fri Dec 27 07:51:26 PM IST 2024
#Modified Date:
#Author: Harsha
# Start #

echo -e "Enter your nationality"
read -r nationality
echo -e "Enter your age"
read -r age

if [ $nationality = "indian" ]; then
    if [ $age -lt 18 ]; then
    echo "You cant drive because you are too young"
    else
    echo "You are eligible for DL"
    fi

else
echo "You must have to be indian to get a DL"
fi

# END #
❯ ./nestedifelse.sh
Enter your nationality
indian
Enter your age
12
You cant drive because you are too young
❯ ./nestedifelse.sh
Enter your nationality
american
Enter your age
22
You must have to be indian to get a DL

```


## While loop 

```bash
                                                                            ─╯
❯ cat whileloop.sh
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
❯ ./whileloop.sh
Please enter one value : 4
4 * 1 = 4
4 * 2 = 8
4 * 3 = 12
4 * 4 = 16
4 * 5 = 20
4 * 6 = 24
4 * 7 = 28
4 * 8 = 32
4 * 9 = 36
4 * 10 = 40

```
## For loop 
```bash
❯ cat hostname
google.com
amazon.com
duckduckgo.com
flipkart.com
friv.com




❯ ./forloop.sh
PING google.com (2404:6800:4007:819::200e) 56 data bytes
64 bytes from maa05s18-in-x0e.1e100.net (2404:6800:4007:819::200e): icmp_seq=1 ttl=115 time=7.28 ms

--- google.com ping statistics ---
1 packets transmitted, 1 received, 0% packet loss, time 0ms
rtt min/avg/max/mdev = 7.275/7.275/7.275/0.000 ms
google.com Host is up
PING amazon.com (205.251.242.103) 56(84) bytes of data.
64 bytes from s3-console-us-standard.console.aws.amazon.com (205.251.242.103): icmp_seq=1 ttl=237 time=239 ms

--- amazon.com ping statistics ---
1 packets transmitted, 1 received, 0% packet loss, time 0ms
rtt min/avg/max/mdev = 239.485/239.485/239.485/0.000 ms
amazon.com Host is up
PING duckduckgo.com (20.204.244.192) 56(84) bytes of data.
64 bytes from 20.204.244.192: icmp_seq=1 ttl=113 time=30.7 ms

--- duckduckgo.com ping statistics ---
1 packets transmitted, 1 received, 0% packet loss, time 0ms
rtt min/avg/max/mdev = 30.733/30.733/30.733/0.000 ms
duckduckgo.com Host is up
PING flipkart.com (103.243.32.90) 56(84) bytes of data.
64 bytes from 103.243.32.90: icmp_seq=1 ttl=54 time=31.5 ms

--- flipkart.com ping statistics ---
1 packets transmitted, 1 received, 0% packet loss, time 0ms
rtt min/avg/max/mdev = 31.527/31.527/31.527/0.000 ms
flipkart.com Host is up
PING friv.com (207.244.69.244) 56(84) bytes of data.
64 bytes from 207.244.69.244: icmp_seq=1 ttl=51 time=239 ms

--- friv.com ping statistics ---
1 packets transmitted, 1 received, 0% packet loss, time 0ms
rtt min/avg/max/mdev = 238.884/238.884/238.884/0.000 ms
friv.com Host is up
❯ cat forloop.sh
#!/bin/bash
#Purpose : For loop table
#Version:1.0
#Created Date: Fri Dec 27 09:20:21 PM IST 2024
#Modified Date:
#Author: Harsha
# Start #
for i in `cat hostname`
do 
ping -c 1 $i
valid=`echo $?`
if [ $valid -gt 1 ]; then 
echo $i "Host is not reachable"
else
echo "$i Host is up"
fi
done
# END #
❯ ./forloop.sh
PING google.com (2404:6800:4007:819::200e) 56 data bytes
64 bytes from maa05s18-in-x0e.1e100.net (2404:6800:4007:819::200e): icmp_seq=1 ttl=115 time=43.1 ms

--- google.com ping statistics ---
1 packets transmitted, 1 received, 0% packet loss, time 0ms
rtt min/avg/max/mdev = 43.102/43.102/43.102/0.000 ms
google.com Host is up
PING amazon.com (205.251.242.103) 56(84) bytes of data.
64 bytes from s3-console-us-standard.console.aws.amazon.com (205.251.242.103): icmp_seq=1 ttl=237 time=238 ms

--- amazon.com ping statistics ---
1 packets transmitted, 1 received, 0% packet loss, time 0ms
rtt min/avg/max/mdev = 238.159/238.159/238.159/0.000 ms
amazon.com Host is up
PING duckduckgo.com (20.204.244.192) 56(84) bytes of data.
64 bytes from 20.204.244.192: icmp_seq=1 ttl=113 time=31.5 ms


```


```bash
❯ cat forloop2.sh
#!/bin/bash
#Purpose : Second for loop
#Version:1.0
#Created Date: Fri Dec 27 09:28:38 PM IST 2024
#Modified Date:
#Author: Harsha
# Start #
for i in 1 2 3 4 5 
do 
echo $i
done
# END #
❯ ./forloop2.sh
1
2
3
4
5

```
## Case statement

```bash
❯ cat casestatement.sh
#!/bin/bash
#Purpose : Example for case statement
#Version:1.0
#Created Date: Fri Dec 27 09:30:48 PM IST 2024
#Modified Date:
#Author: Harsha
# Start #

echo -c "Enter a number: \c"
read -r a
echo -c "Enter b number: \c"
read -r b

echo "1. Sum"
echo "2. Sub"
echo "3. Mul"
echo "4. Div"
echo "5. Mod"

echo -c "Enter your choice here: \c"
read -r ch
case $ch in 
1) echo "Sum of $a and $b = `expr $a + $b`";;
2) echo "Sub of $a and $b = `expr $a - $b`";;
3) echo "Mul of $a and $b = `expr $a \* $b`";;
4) echo "Div of $a and $b = `expr $a / $b`";;
5) echo "Mod of $a and $b = `expr $a % $b`";;
*) echo "Invalid option !"
esac
# END #
❯ ./casestatement.sh
-c Enter a number: \c
5
-c Enter b number: \c
6
1. Sum
2. Sub
3. Mul
4. Div
5. Mod
-c Enter your choice here: \c
3
Mul of 5 and 6 = 30

```


## Continue Statement

What is a continue statement in simple words

```bash
cat continuestatement.sh
#!/bin/bash
#Purpose : While loop continue statement
#Version:1.0
#Created Date: Fri Dec 27 09:36:39 PM IST 2024
#Modified Date:
#Author: Harsha
# Start #
opt=y
while [ $opt = y  -o $opt = Y ]
    do 
    echo -e "Please enter the number : \c"
    read -r num
    if [ $num -le 50 ]; then
        sq=`expr $num \* $num`
        echo "Square of provided number $num: $sq"
    else 
        echo "Number not in the given Range"
    fi
echo -e "Do you want to continue [y/n]: \c"
read -r wish
if [ $wish = y -o $wish = Y ]; then
    continue
else 
    echo "Thank you for Exiting...."
    exit 
fi
done
# END #
❯ ./continuestatement.sh
Please enter the number : 4
Square of provided number 4: 16
Do you want to continue [y/n]: y
Please enter the number : 2
Square of provided number 2: 4
Do you want to continue [y/n]: n
Thank you for Exiting....


```


## Set command 

why is set used 
set feature is used to set the values as the positional parameters
```bash
❯ cat setcommand.sh
#!/bin/bash
#Purpose : Set assigns its arguments to the positional parameters
#Version:1.0
#Created Date: Sat Dec 28 05:13:14 AM IST 2024
#Modified Date:
#Author: Harsha
# Start #
set `date`
echo "Today is $1"
echo "Month is $2"
echo "Date is $3"
echo "Time H:M:S is $4"
echo "Timezone is $5"
echo "Year is $6"

# END #
❯ ./setcommand.sh
Today is Sat
Month is Dec
Date is 28
Time H:M:S is 05:15:17
Timezone is AM
Year is IST

```



## Shift Positional Parameters
transfers content to its immediate lower numbered .....

```bash

❯ cat shiftparameters.sh
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
❯ ./shiftparameters.sh
Count 7
Sat Dec 28 05:21:52 AM
Dec 28 05:21:52 AM IST
28 05:21:52 AM IST 2024
IST 2024   

```
## Functions

- What is a function
```bash
❯ cat 1function.sh
#!/bin/bash
#Purpose : Function example. Taking Backup of Particular file
#Version:1.0
#Created Date: Sat Dec 28 05:23:15 AM IST 2024
#Modified Date:
#Author: Harsha
# Start #

function takebackup (){
    if [ -f $1 ]; then
    BACKUP="/opt/$(basename ${1}).$(date +%F).$$"
    echo "Backing up $1 to ${BACKUP}"
    cp $1 $BACKUP
    fi
}

takebackup ~/Desktop/temp.html
    if [ $? -eq 0 ]; then 
    echo "Backup Success"
    fi
# END #
❯ ./1function.sh
Backing up /home/harsha/Desktop/temp.html to /opt/temp.html.2024-12-28.5704
cp: cannot create regular file '/opt/temp.html.2024-12-28.5704': Permission denied

```




## Until Loop 
- runs until the condition is true
- 
```bash
❯ cat untilstatement.sh
#!/bin/bash
#Purpose : Until Loop Example for host ping 
#Version:1.0
#Created Date: Sat Dec 28 05:29:32 AM IST 2024
#Modified Date:
#Author: Harsha
# Start #
echo -e "Please enter the IP address to Ping: \c"
read -r ip 
until ping -c 3 $ip 
do 
    echo "Host $ip is Still Down"
    sleep 1
done 
echo "Host $ip is Up Now"
# END #
❯ ./untilstatement.sh
Please enter the IP address to Ping: google.com
PING google.com (2404:6800:4007:819::200e) 56 data bytes
64 bytes from maa05s18-in-x0e.1e100.net (2404:6800:4007:819::200e): icmp_seq=1 ttl=115 time=6.95 ms
64 bytes from maa05s18-in-x0e.1e100.net (2404:6800:4007:819::200e): icmp_seq=2 ttl=115 time=10.5 ms
64 bytes from maa05s18-in-x0e.1e100.net (2404:6800:4007:819::200e): icmp_seq=3 ttl=115 time=9.29 ms

--- google.com ping statistics ---
3 packets transmitted, 3 received, 0% packet loss, time 2004ms
rtt min/avg/max/mdev = 6.948/8.926/10.539/1.488 ms
Host google.com is Up Now

```
## Arrays

- supported in korn and bash shell 
- one dimensional 
```bash
❯ cat arrayex.sh
#!/bin/bash
#Purpose : Array example
#Version:1.0
#Created Date: Sat Dec 28 05:34:21 AM IST 2024
#Modified Date:
#Author: Harsha
# Start #
Month=(0 1 2 3 4 5)
echo ${Month[2]}
echo ${Month[@]}
echo ${#Month[@]}
# END #
❯ ./arrayex.sh
2
0 1 2 3 4 5
6

```

```bash
❯ cat arrays2.sh
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
❯ ./arrays2.sh
Fruit Name is Apple
Fruit Name is Orange
Fruit Name is Banana
Fruit Name is Green
Fruit Name is Apple
Number of Fruits in the basket is  5
All Fruits Apple Orange Banana Green Apple

```
## Getopts

What is getops 
```bash
❯ cat getops.sh
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
❯ ./getops.sh -a apple -b boy -d 213
I dont know what is d is 
Option A = apple and Option B = boy

```

## Writing CPU Usage Alerts Scripts

```bash
#!/bin/bash
#Purpose: Monitor CPU utilization and send alerts based on thresholds
#Version: 1.0
#Created Date: Sat Dec 28 05:46:45 AM IST 2024
#Modified Date: 
#Author: Harsha
# Start #

# Set paths and configurations
HOSTNAME=$(hostname)                   # Get the hostname of the system
CRITICAL=98                            # Critical CPU usage threshold
WARNING=90                             # Warning CPU usage threshold
CRITICALMail="mail@yahoo.com"          # Email for critical alerts
MAILWAR="Youremail@domain.in"          # Email for warning alerts
LOGDIR="/var/log/cputilhist"           # Directory for log files
LOGFILE="$LOGDIR/cpusage-$(date +%h%d%y).log"  # Log file path with a timestamp

# Create the log directory if it doesn't exist
mkdir -p "$LOGDIR"

# Create the log file if it doesn't exist
touch "$LOGFILE"

# Monitor CPU utilization
while true; do
    # Fetch CPU load using the `top` command
    CPULOAD=$(top -b -n 1 | grep "Cpu(s)" | awk '{print $2}' | awk -F. '{print $1}')

    # Validate CPU load thresholds and send alerts
    if [ -n "$WARNING" ] && [ -n "$CRITICAL" ]; then
        if [ "$CPULOAD" -ge "$WARNING" ] && [ "$CPULOAD" -lt "$CRITICAL" ]; then
            # Log warning message
            echo "$(date "+%F %H:%M:%S") WARNING - CPU Load: $CPULOAD% on Host: $HOSTNAME" >> "$LOGFILE"
            
            # Send warning email
            echo "Warning: CPU Load $CPULOAD% on Host $HOSTNAME" | mail -s "CPU Load Warning" "$MAILWAR"
        elif [ "$CPULOAD" -ge "$CRITICAL" ]; then
            # Log critical message
            echo "$(date "+%F %H:%M:%S") CRITICAL - CPU Load: $CPULOAD% on Host: $HOSTNAME" >> "$LOGFILE"
            
            # Send critical email
            echo "Critical: CPU Load $CPULOAD% on Host $HOSTNAME" | mail -s "CPU Load Critical" "$CRITICALMail"
        fi
    fi

    # Wait for 60 seconds before the next check
    sleep 60
done

# END #

```
## Cron jobs

Basics here
## Disk space usage monitoring Script

```bash
#!/bin/bash
#Purpose: Monitoring disk space utilization and sending email alerts
#Version: 1.0
#Created Date: Sat Dec 28 06:10:20 AM IST 2024
#Modified Date: 
#Author: Harsha
# Start #

THRESHOLD=40                            # Disk usage threshold percentage
mailTo="root"                           # Recipient email address
HOSTNAME=$(hostname)                    # System hostname
TEMPFILE="/tmp/disk_usage_alert.txt"    # Temporary file to store alert details

# Clean the temporary file if it exists
rm -f $TEMPFILE

# Check each disk's usage
for usage in $(/bin/df -h | grep -vE 'Filesystem|tmpfs' | awk '{print $5}' | sed 's/%//g'); do
    if [ "$usage" -ge "$THRESHOLD" ]; then
        /bin/df -h | grep "$usage%" >> $TEMPFILE
    fi
done

# Send email alert if any usage exceeds the threshold
if [ -s $TEMPFILE ]; then
    mail -s "$HOSTNAME Disk Usage Alert: Critical" $mailTo < $TEMPFILE
    echo "Disk usage alert sent to $mailTo"
else
    echo "No disk usage exceeds the threshold of $THRESHOLD%"
fi

# Clean up the temporary file
rm -f $TEMPFILE

# END #

```


## Troubleshooting (Debugging) shell scripts

- add `-x before` executing
- else add `#!/bin/bash -x`  in the top of the file
- ascii characters from your copied script might be different so it might give errors
- correct it using `dos2unix filename.sh`
- shellcheck.net for debugging the shell script 



## Here Documents 
here documents are used to ......
```bash
#!/bin/bash
#Purpose : Here document
#Version:1.0
#Created Date: Sat Dec 28 06:30:12 AM IST 2024
#Modified Date:
#Author: Harsha
# Start #
cat << 'LINESOFTEXT'
This is the first line of the document
second line 
some text
LINESOFTEXT
# END #
```


## Internal Field Separator - IFS
used to separate the fields

```bash

❯ cat ifs.sh
#!/bin/bash
#Purpose : Internal field seperator
#Version:1.0
#Created Date: Sat Dec 28 06:34:03 AM IST 2024
#Modified Date:
#Author: Harsha
# Start #
LINE=`cat /etc/passwd | grep $1`
IFS=:
set $LINE
echo "User Name = $1"
echo "Password = $2"
echo "UID = $3"
echo "GID = $4"
echo "Description = $5"
echo "Home Directory = $6"
echo "Current Shell = $7"

# END #
❯ ./ifs.sh harsha
User Name = harsha
Password = x
UID = 1000
GID = 1000
Description = Harsha,,,
Home Directory = /home/harsha
Current Shell = /usr/bin/zsh

```

## Eval Command
What is eval command?


```bash
❯ cat evalcmd.sh
#!/bin/bash
#Purpose : eval command Evaluating twice
#Version:1.0
#Created Date: Sat Dec 28 06:39:04 AM IST 2024
#Modified Date:
#Author: Harsha
# Start #
COMMAND="ls -ltr /etc"
echo "$COMMAND"
eval $COMMAND

# END #
❯ ./evalcmd.sh
ls -ltr /etc
total 1360
-rw-r--r--  1 root   root    3663 Jun 20  2016 screenrc
-rw-r--r--  1 root   root      45 Jan 25  2020 bash_completion
-rw-r--r--  1 root   root   12813 Mar 28  2021 services
-rw-r--r--  1 root   root     449 Dec 11  2021 mailcap.order
-rw-r--r--  1 root   root     119 Jan 11  2022 catdocrc

```
## Running multiple scripts under a single script 

```bash
❯ cat multiplescripts.sh
#!/bin/bash
#Purpose : executing multiple scripts from single script
#Version:1.0
#Created Date: Sat Dec 28 06:46:38 AM IST 2024
#Modified Date:
#Author: Harsha
# Start #
echo "First Script Output"
echo "Calling the second script"
sh ~/scripts/secondfile.sh

# END #
❯ cat secondfile.sh
#!/bin/bash
#Purpose :
#Version:1.0
#Created Date: Sat Dec 28 06:48:16 AM IST 2024
#Modified Date:
#Author: Harsha
# Start #
echo "Hello from the second file !!"
# END #
❯ ./multiplescripts.sh
First Script Output
Calling the second script
Hello from the second file !!


```

## Logger Command
