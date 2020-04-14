#!/usr/bin/env bash

aws s3 sync s3://${S3_PROVISIONING_PATH} ${GF_PATHS_PROVISIONING}
exec /run.sh