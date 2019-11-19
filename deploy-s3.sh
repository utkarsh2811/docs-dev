#!/usr/bin/env bash

bundle exec middleman build --verbose --clean --build-dir=/usr/src/app/build

aws2 s3 sync build s3://dev.intempt.com

pwd

ls

ls build/*

ls ./build/*

aws2 cloudfront create-invalidation --distribution-id E2ETS3E2R2MJV4 --paths "/*"
