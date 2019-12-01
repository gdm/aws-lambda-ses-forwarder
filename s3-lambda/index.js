
var aws = require('aws-sdk');

var LambdaForwarder = require("./aws-lambda-ses-forwarder.js");

exports.handler = function(event, context, callback) {
  console.log("Request received:\n", JSON.stringify(event));
  // See aws-lambda-ses-forwarder/index.js for all options.
  var overrides = {
    config: {
      fromEmail: "noreply@contrall.info",
      emailBucket: "ses-emailss3bucket-6qhwieg4kbqy",
      emailKeyPrefix: "forwarder/",
      forwardMapping: {
        "test123@contrall.info": [
          "dmytro.gorbunov@gmail.com"
        ],
        "test124@contrall.info": [
          "dmitro.gorbunov@gmail.com"
        ],
        "@contrall.info": [
          "dmytro.gorbunov@gmail.com"
        ]
      }
    }
  };
  LambdaForwarder.handler(event, context, callback, overrides);
};
