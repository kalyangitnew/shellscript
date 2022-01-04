# MOST OF TIMES WE CANNOT HARDCODE THE VALUES AND WE CANNOT DO FOR COMMAND SUBSTITUTION
# SO WE NEED TO ASK FOR USER TO GIVE INPUT
# WHILE EXECUTING THE SCRIPT WE WILL USE "read" TO HAVE INPUT FROM HERE.
read -p 'ENTER YOUR NAME: ' name
read -p 'ENTER YOUR AGE: ' age
echo -e "your name = $name\nyour age = $age"

# above approach used when the script executed manually.so when automation setup is will not work
# for that before execution we will store store some inputs and those inputs will be loaded by script
# special variables are &0-&n,&*,&@.&#
# $0 - script name
#

