#!/bin/bash -xe

rm -r function.zip
cd s3-lambda
zip -r ../function.zip .
cd -
aws s3 cp function.zip s3://info-contrall-code/lambda-forwarder/v1/function.zip

AWS_PROFILE=dmgo-admin aws cloudformation deploy --stack-name SES --template-file ses.yml --capabilities CAPABILITY_IAM

