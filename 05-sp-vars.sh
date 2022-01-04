echo 0 = $0
# $0 is script name
echo 1 = $1
# it will be the first argument for the script
# when we do "bash 05-sp-var.sh" we will get only 0=05-sp-var.sh if we do
# like bash 05-sp-var.sh kalyan 10 it will take 1 as kalyan and 2 as 10
echo 2 = $2
# it will be the second argument for the script
echo "* = $*"
echo "@ = $@"
# * and @ are giving all the arguments i t print as "kalyan 10'
echo "# = $#"
# as the # will give the no of variables in line of executing as there only it will gives "# - 2"

echo -e "your name = $1\nyour no = $2"