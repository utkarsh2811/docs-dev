#!/bin/bash

bundle exec middleman build --clean

aws2 s3 sync build s3://dev.intempt.com

aws2 cloudfront create-invalidation --distribution-id E2ETS3E2R2MJV4 --paths "/*"
