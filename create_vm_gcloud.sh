#!/bin/bash

# Variables
PROJECT_ID="learned-nimbus-429813-b5"
ZONE="us-central1-a"
INSTANCE_NAME="shell-script-vm"
MACHINE_TYPE="e2-micro"
IMAGE_FAMILY="ubuntu-2004-lts"
IMAGE_PROJECT="ubuntu-os-cloud"
DISK_SIZE="10" # in GB

# Set the project
gcloud config set project $PROJECT_ID

# Create the compute instance
gcloud compute instances create $INSTANCE_NAME \
    --zone=$ZONE \
    --machine-type=$MACHINE_TYPE \
    --image-family=$IMAGE_FAMILY \
    --image-project=$IMAGE_PROJECT \
    --boot-disk-size=$DISK_SIZE \
    --boot-disk-type=pd-standard \
    --boot-disk-device-name=$INSTANCE_NAME

if [ $? -eq 0 ]; then
    echo "Compute Engine instance '$INSTANCE_NAME' created successfully in zone $ZONE."
else
    echo "failed to create instance $INSTANCE_NAME"
fi