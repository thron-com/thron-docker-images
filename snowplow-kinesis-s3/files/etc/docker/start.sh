#!/bin/bash

if [ -z "${SNOWPLOW_KINESIS_S3_KINESIS_STREAM_REGION}" ]; then echo "Missing SNOWPLOW_KINESIS_S3_KINESIS_STREAM_REGION variable"; exit 1; fi
if [ -z "${SNOWPLOW_KINESIS_S3_KINESIS_STREAM_IN_NAME}" ]; then echo "Missing SNOWPLOW_KINESIS_S3_KINESIS_STREAM_IN_NAME variable"; exit 1; fi
if [ -z "${SNOWPLOW_KINESIS_S3_KINESIS_STREAM_OUT_BAD_NAME}" ]; then echo "Missing SNOWPLOW_KINESIS_S3_KINESIS_STREAM_OUT_BAD_NAME variable"; exit 1; fi
if [ -z "${SNOWPLOW_KINESIS_S3_KINESIS_STREAM_APP_NAME}" ]; then echo "Missing SNOWPLOW_KINESIS_S3_KINESIS_STREAM_APP_NAME variable"; exit 1; fi

if [ -z "${SNOWPLOW_KINESIS_S3_BUCKET_REGION}" ]; then echo "Missing SNOWPLOW_KINESIS_S3_BUCKET_REGION variable"; exit 1; fi
if [ -z "${SNOWPLOW_KINESIS_S3_BUCKET_NAME}" ]; then echo "Missing SNOWPLOW_KINESIS_S3_BUCKET_NAME variable"; exit 1; fi

if [ -z "${SNOWPLOW_KINESIS_S3_BUFFER_BYTE_THRESHOLD}" ]; then echo "Missing SNOWPLOW_KINESIS_S3_BUFFER_BYTE_THRESHOLD variable"; exit 1; fi
if [ -z "${SNOWPLOW_KINESIS_S3_BUFFER_RECORD_THRESHOLD}" ]; then echo "Missing SNOWPLOW_KINESIS_S3_BUFFER_RECORD_THRESHOLD variable"; exit 1; fi
if [ -z "${SNOWPLOW_KINESIS_S3_BUFFER_TIME_THRESHOLD}" ]; then echo "Missing SNOWPLOW_KINESIS_S3_BUFFER_TIME_THRESHOLD variable"; exit 1; fi

if [ -z "${SNOWPLOW_KINESIS_S3_LOG_LEVEL}" ]; then export SNOWPLOW_KINESIS_S3_LOG_LEVEL="INFO"; fi

echo "Rendering configuration"
envsubst < /etc/snowplow/templates/snowplow-kinesis-s3.hocon > /etc/snowplow/snowplow-kinesis-s3.hocon

echo "Starting snowplow-stream-collector"
snowplow-kinesis-s3 --config /etc/snowplow/snowplow-kinesis-s3.hocon

