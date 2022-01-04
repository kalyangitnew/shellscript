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
echo "# = $#"


