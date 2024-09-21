#!/bin/bash

read -p "Enter your cloud platform: " cloud

if [[ "$cloud" = "AWS" || "$cloud" = "aws" ]]; then
  echo "you are in AWS"
elif [[ "$cloud" = "GCP" || "$cloud" = "gcp" ]]; then
   echo "you are in GCP"
else
   echo "you are using unknown cloud platform"
fi