#!/usr/bin/env bash

bundle exec middleman build --clean

aws2 s3 sync build s3://dev.intempt.com
