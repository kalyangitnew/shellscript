#!/bin/bash
COUNT=$(aws ec2 describe-instances --filters "Name=tag:Name,Values=$1" | jq ".Reservations[].Instances[].InstanceId" | wc -l)

if [ $COUNT -eq 1 ]; then
  aws ec2 run-instances --image-id ami-0760b951ddb0c20c9 --instance-type t3.micro --tag-specifications "ResourceType=instance,Tags=[{Key=Name,Value=$1}]" | jq
else
  echo"Instance which you are creating already exists"
fi
