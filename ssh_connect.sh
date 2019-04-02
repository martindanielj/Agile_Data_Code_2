#! /usr/bin/env bash

aws ec2 start-instances --instance-ids i-0e84a93dd00b0764b

sleep 30

EC2_HOSTNAME=`aws ec2 describe-instances --instance-ids i-0e84a93dd00b0764b --query 'Reservations[*].Instances[*].PublicDnsName' --output=text`
if [ -z $EC2_HOSTNAME ]; then
  echo ""
  echo "No hostname detected in '.ec2_hostname' :( Exiting!"
  echo ""
  echo "The command to create an ssh tunnel to port 5000 of your ec2 instance is: ssh -R 5000:localhost:5000 ubuntu@<ec2_hostname>"
  echo ""
  exit
fi

ssh -i ./agile_data_science.pem ubuntu@$EC2_HOSTNAME

