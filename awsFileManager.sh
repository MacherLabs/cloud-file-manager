#!/bin/bash

## Environment Variables Dependencies
#AWS_DEFAULT_REGION
#AWS_ACCESS_KEY_ID
#AWS_SECRET_ACCESS_KEY
#AWS_BUCKET_NAME

function usage(){
  echo "envVar1= ... envVar2= ... envVar3= ... envVar4= ... bash awsFileManager.sh <src-file> <destination>"  
  echo "Standard for file located at S3: s3://<AWS_BUCKET_NAME>/<file-name>"
}

function envValidation(){
  echo "Checking for AWS credentials"
  if [[ -z "${AWS_DEFAULT_REGION}" ]]; then
    echo "AWS_DEFAULT_REGION is undefined"
    usage
    exit 1
  fi

  if [[ -z "${AWS_ACCESS_KEY_ID}" ]]; then
    echo "AWS_ACCESS_KEY_ID is undefined"
    usage
    exit 1
  fi

  if [[ -z "${AWS_SECRET_ACCESS_KEY}" ]]; then
    echo "AWS_SECRET_ACCESS_KEY is undefined"
    usage
    exit 1
  fi

  if [[ -z "${AWS_BUCKET_NAME}" ]]; then
    echo "AWS_BUCKET_NAME is undefined"
    usage
    exit 1
  fi
}

envValidation
echo "AWS credentials present!! List of accessible S3 buckets"

# destination="s3://$AWS_BUCKET_NAME/$2"
echo "Src: $1"
echo "Destination: $2"
aws s3 cp $1 $2 --recursive
