#!/bin/bash

bundle exec middleman build --clean

aws s3 sync build s3://dev.intempt.com

aws cloudfront create-invalidation --distribution-id EOWUY7D6YABHK --paths "/*"
