
#aws cloudformation create-stack --stack-name SES --template-body file://ses.yml  --parameters ParameterKey=ConfigSetName,ParameterValue=ManagedConfigSetName ParameterKey=DomainRuleSetName,ParameterValue=ManagedDomainRuleSetName ParameterKey=DomainName,ParameterValue=contrall.info

#error: 
#Could not write to bucket: ses-emailss3bucket-1p46c11suzw9p (Service: AmazonSimpleEmailService; Status Code: 400; Error Code: InvalidS3Configuration; Request ID: c36f1c6d-fe17-449a-9035-3eac54391d10)

#aws ses set-active-receipt-rule-set --rule-set-name ManagedDomainRuleSetName

aws cloudformation deploy --stack-name SES --template-file ses.yml --capabilities CAPABILITY_IAM
