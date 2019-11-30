
var aws = require('aws-sdk');

exports.handler = function(event, context) {
  console.log("Request received (code from s3 bucket v2):\n", JSON.stringify(event));
};
