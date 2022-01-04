#!/bin/bash

## if we assign a name to se of data then it is called as variable
# SYNTAX : VAR=DATA

# Number
a=100
# string
b=abc
n=hi

# In bash shell there are no different data types.it considers everything as 'string"

# access the data in shell using "$" charecters prefixing the variable name
# or u can also access variable with ${}

echo value of a = $a
echo value of b = $b
echo value of c = ${n}
x=20
y=20
echo ${x}x${y} = 400
# all the time we will not hardcore the data we should get the date dynamically
# DATE=2012-10-20
DATE=$(date +%F) # command type
echo today date is $DATE
# we need to use "()" for saving dynamic varaible
# arth substitution
ADD=$((2+3+4*5-7))
echo added = $ADD
