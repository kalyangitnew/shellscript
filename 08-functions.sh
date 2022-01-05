#!/bin/bash
# if we assign a name to some set of commands then it is called function.
# functions are used to keep code "DRY" (MEANS NO NEED TO REPEAT)
# FUNCTIONS are also used to group the commands logically
 # functions should always declare before using like variable
 # thats why functions are find at starting of the function
  # example beloe

function abc() {
  echo i am function of abc
}
## main programme line is before for above function
abc

# or we can use like below
foo() {
  echo i am foo
}
foo

# if we declare variables in main program can access them in function & vice-versa
# variables of main programme can be overwritten by function and vice-versa
# special arguments which we entered in CLI cannot access by functions as functions has it own arguments
# example for below
function xyz() {
  echo i am function of xyz
  b=20
  echo variable is taken from proagram to function = $c
}
## main programme line is before for above function
c=23
xyz
echo b in main programme from it function=$b
# example for above cli statement
function xda() {
  echo first argument = $1
}
## main programme line is before for above function
echo first argument = $1
# do above by dng bash 08-functions.sh kalyan see the output
# "" return "'
# for coming out of the function we will use this
function daew() {
  r=1
  return
  echo variable j=$j
}
daew
echo r=$r
echo exit status of daew = &?