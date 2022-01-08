#!/bin/bash

# loops
# while loop and for loop
# for reverse of while is until and reverse for "for" is select

# while uses for expression in functions

b=10
for b in 1 2 3 4 5 6 7 8 9 10
do
    if [ $b == 5 ]
    then
        break
    fi
    # Print the value
    echo "Iteration no $b"
done


a=10
while [ $a -gt 0 ]; do
  echo while Loops
  sleep 1
  a=$((a-1))
done
# it may be infinite we need to set up some finite see common.sh or other components files for use

# SYNTAX FOR for loop
# for var in items; do commands ; done

for fruit in apple bananna grape ; do
  echo fruit name = $fruit
done

# while loop is always and infinite loop

echo "checking connection on port 22 for host"
while true ; do
  nc -z $1 22 &>>/dev/null
  if [ $? -eq 0 ]; then
   break
  fi
  sleep 1
done



break
