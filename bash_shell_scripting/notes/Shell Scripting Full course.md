
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


## For loop 


## Case statement


## Continue Statement

