#!/bin/bash 
#export BUCKETNAME="vedalabs-staging-insights"
#export BUCKETREGION="us-west-2"
#export WEBSITEENDPOINT="http://$BUCKETNAME.s3-website-$BUCKETREGION.amazonaws.com"

BUCKETNAME=$1
BUCKETREGION=$2
RESULT=2 

if [ ! -z "$1" ]
then
	echo "bucket name valid-"$BUCKETNAME
else
	echo "No bucket name found"
	echo "Ex usage: 'bash staticwebsitecreator.sh my-bucket-name us-region' "
	exit 1
fi

if [ ! -z "$2" ]
then
	echo "Deployment region valid-"$BUCKETREGION
else
	echo "No valid bucket region found"
	echo "Ex usage: 'bash staticwebsitecreator.sh my-bucket-name us-region' "
	exit 1
fi

until [  $RESULT -eq 0 ]; do
    echo "Trying to create s3 bucket"
    aws s3 mb s3://vedalabs-staging-insights --region us-west-2
    RESULT=$?
    echo "sleeping again"
    sleep 60
done 
echo "Bucket created!"
echo "your website is ready at: "$WEBSITEENDPOINT
