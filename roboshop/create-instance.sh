#!/bin/bash
aws ec2 run-instances --image-id ami-0760b951ddb0c20c9 --instance-type t3.micro --tag-specifications "ResourceType=instance,Tags=[{Key=Name,Value=$1}]"