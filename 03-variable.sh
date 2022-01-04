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
# arth substitution FOR THAT WE NEED TO USE "((ARTHIMETIC EXPRESSION))"
ADD=$((2+3+4*5-7))
echo added = $ADD

echo COURSE NAME = $COURSE_NAME
 # if i execute this above line it shoes empty as COURSE_NAME is not mentioned or declared anywhere
 # so if we given in terminal like COURSE_NAME=KALYAN still itwill not take any varaible
 # we will use "export command" in "terminal" to save the varaible from there to local
 # means syntax will be "export COURSE_NAME=kalyan" and if we now execute we can get COURSE NAME=kalyan
# export will make it as environmental varaible

# we have name diaries also we can save no s also

#syntax will be "declare -A asarray2=([h1]=kalyan [h2]=kumar)

declare -A assArray2=( [HDD]=Samsung [Monitor]=Dell [Keyboard]=A4Tech )
echo ${assArray2[HDD]}
