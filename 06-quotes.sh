# single quates will print what ever we give
# double quotes consider as varaiblae
# example = single quote
# a = 10
# echo '$a' ---> result is $a
# for double quate echo "$a" ---> it will be resluts value 10
# echo -e "hello\nworld'  --- > it resluts hello in line and world in another line
# as if we use single quate in above line we will get results as ---> hellm\nworld


# redirectors
# < and > these are STDIN & STDOUT
# > is output will go to that file , open any folder do ls >/tmp/out all files in opened folder copied to /tmp/out
# < input is taking to that file , example mongo < /tmp/mongo if we load any commands in mongo file all will be executed mongo command(takes input)
# " >> " it is used for appending symbol means everytime new line will be added with previous  example : date >>/tmp/date
# > for std out ,,   &> for stderr.
# if we dnt want any error to save    "  &>dev/null  "
