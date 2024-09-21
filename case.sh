#!/bin/bash

read -p "Enter your cloud platform: " cloud

case "$cloud" in
  AWS|aws)
  echo "you are using AWS cloud"
  ;;

  GCP|gcp)
  echo "you are using Google Cloud Platform"
  ;;
  
  *)
  echo "you are using unknown cloud platform"
  ;;

esac