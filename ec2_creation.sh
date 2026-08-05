#Description= This is for creating ec2 instance on aws using shell-scrip
#Author= Shubham Kumar
#Date= 2023-10-01
#!/bin/bash
# Check if the required arguments are provided
if [ "$#" -ne 3 ]; then
    echo "Usage: $0 <instance_type> <key_name> <security_group>"
    exit 1
fi
# Assign command line arguments to variables
INSTANCE_TYPE=$1
KEY_NAME=$2
SECURITY_GROUP=$3
# Set the region and AMI ID
REGION="us-east-1"
AMI_ID="ami-0c55b159cbfafe1f0" # Amazon Linux 2 AMI (HVM), SSD Volume Type
# Create the EC2 instance
INSTANCE_ID=$(aws ec2 run-instances \
    --image-id $AMI_ID \
    --count 1 \
    --instance-type $INSTANCE_TYPE \
    --key-name $KEY_NAME \
    --security-groups $SECURITY_GROUP \
    --region $REGION \
    --query 'Instances[0].InstanceId' \
    --output text)
# Check if the instance was created successfully
if [ $? -ne 0 ]; then
    echo "Failed to create EC2 instance."
    exit 1
fi
# Wait for the instance to be in running state
aws ec2 wait instance-running --instance-ids $INSTANCE_ID --region $REGION
# Check if the instance is running
if [ $? -ne 0 ]; then
    echo "Instance is not running."
    exit 1
fi