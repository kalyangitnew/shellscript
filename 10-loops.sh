#!/bin/bash

# loops
# while loop and for loop
# for reverse of while is until and reverse for "for" is select

# while uses for expression in functions
a=10
while [ $a -gt 0 ]; do
  echo while Loops
  sleep 1
  a=$((a-1))
done
# it may be infinite we need to set up some finite see common.sh or other components files for use
