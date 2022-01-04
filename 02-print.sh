#!/bin/bash

# to print some info on the screen we will echo command and prints.sh
# here we will goint to use echo command in our practice
# syntax is below mentioned
# echo message -- just it will print message

echo hello world this is kalyan
echo welcome

# printing information is very useful while running to tell user what is happening and what is executing

# to get attention from users we will use some commands called "ESC sequences"
# \n --- new line  and \e ---- new tab \t for tab spaces
# syntax : echo -e "message1\n message2"
echo -e "kalyan \n hello"
# for using any esc sequences we will use "-e" and invereted commas for in line.
# we can run two comments in terminal by ";" example git pull ; bash 02-print.sh
# COLOURED output
# syntax: echo -e "\e[COLmMESGAGE" , IN this col is colour code \e is to execute in colour and "m" is added for executing.
##COLORS  #CODE
#RED       31
#GREEN     32
#YELLOW    33
#BLUE      34
#MAGENTA   35
#CYAN      36

echo -e "\e[34mText in blue colour"

# for more colours concept "https://misc.flogisoft.com/bash/tip_colors_and_formatting'

# colour will always follow if we give colour and after some othere text it will print in same colour

echo -e "\e[34mText in blue colour"
echo hello world

# we need to disable colour follow concept we will use "\e[0m' at last for disabling colour concept
echo -e "\e[36mText in cyan colour is disable after this\e[0m"
echo hello world this text will be in normal colour
