#!/bin/bash
COUNT=$(aws ec2 describe-instances --filters "Name=tag:Name,Values=$1" | jq ".Reservations[].Instances[].PrivateIpAddress" | grep -v null  | wc -l)

if [ $COUNT -eq 0 ]; then
  aws ec2 run-instances --image-id ami-0760b951ddb0c20c9 --instance-type t3.micro --security-group-ids sg-0db1f455d56fb942d --tag-specifications "ResourceType=instance,Tags=[{Key=Name,Value=$1}]" | jq
else
  echo "Instance which you are creating already exists"
fi

# in above we have some count function and there we have stored the private ip address value of instance named "something which is given in CLI"
# If the named instances private address value after removing null statements is zero we have written a condition saying to create if not create new instance with the name given in CLI
# we have choosen ip address because as instance terminated immediately ip address will gone
