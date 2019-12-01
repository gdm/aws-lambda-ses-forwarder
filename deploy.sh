#!/bin/bash -xe

npm test

CURRENT_VERSION=$(grep -o -P '(?<=lambda-forwarder\/v)\d+' ses.yml)

NEW_VERSION=$((CURRENT_VERSION + 1))

NEW_VERSION_ALIGNED=$(printf "%04d" "$NEW_VERSION")

rm -r function.zip
cp index.js s3-lambda/aws-lambda-ses-forwarder.js
cd s3-lambda

zip -r ../function.zip .
cd -

rm s3-lambda/aws-lambda-ses-forwarder.js

aws s3 cp function.zip s3://info-contrall-code/lambda-forwarder/v${NEW_VERSION_ALIGNED}/function.zip

sed -i -e  "s|lambda-forwarder/v.*|lambda-forwarder/v${NEW_VERSION_ALIGNED}/function.zip|" ses.yml

AWS_PROFILE=dmgo-admin aws cloudformation deploy --stack-name SES --template-file ses.yml --capabilities CAPABILITY_IAM

