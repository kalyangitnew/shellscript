#!/bin/bash

## if we assign a name to se of data then it is called as variable
# SYNTAX : VAR=DATA

# Number
a=100
# string
b=abc
n=hi i am kalyan

# In bash shell there are no different data types.it considers everything as 'string"

# access the data in shell using "$" charecters prefixing the variable name
# or u can also access variable with ${}

echo value of a = $a
echo value of b = $b
echo value of c = ${n}
