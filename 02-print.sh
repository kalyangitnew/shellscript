#!/bin/bash

# to print some info on the screen we will echo command and prints.sh
# here we will goint to use echo command in our practice
# syntax is below mentioned
# echo message -- just it will print message

echo hello world this is kalyan
echo welcome

# printing information is very useful while running to tell user what is happening and what is executing

# to get attention from users we will use some commands called "ESC sequences"
# \n --- new line  and \e ---- new tab
# syntax : echo -e "message1\n message2"
echo -e "kalyan \n hello"
# for using any esc sequences we will use "-e" and invereted commas for in line.
# we can run two comments in terminal by ";" example git pull ; bash 02-print.sh
