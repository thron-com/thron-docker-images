#!/bin/bash

if [ -z "${SNOWPLOW_STREAM_ENRICH_RESOLVER_DYNAMODB}" ]; then export SNOWPLOW_STREAM_ENRICH_RESOLVER_DYNAMODB="--resolver dynamo:${SNOWPLOW_STREAM_ENRICH_RESOLVER_DYNAMODB}"; fi

if [ -z "${SNOWPLOW_STREAM_ENRICH_KINESIS_STREAM_IN_NAME}" ]; then echo "Missing SNOWPLOW_STREAM_ENRICH_KINESIS_STREAM_IN_NAME variable"; exit 1; fi
if [ -z "${SNOWPLOW_STREAM_ENRICH_KINESIS_STREAM_BUFFER_BYTE_LIMIT}" ]; then echo "Missing SNOWPLOW_STREAM_ENRICH_KINESIS_STREAM_BUFFER_BYTE_LIMIT variable"; exit 1; fi
if [ -z "${SNOWPLOW_STREAM_ENRICH_KINESIS_STREAM_BUFFER_RECORD_LIMIT}" ]; then echo "Missing SNOWPLOW_STREAM_ENRICH_KINESIS_STREAM_BUFFER_RECORD_LIMIT variable"; exit 1; fi
if [ -z "${SNOWPLOW_STREAM_ENRICH_KINESIS_STREAM_BUFFER_TIME_LIMIT}" ]; then echo "Missing SNOWPLOW_STREAM_ENRICH_KINESIS_STREAM_BUFFER_TIME_LIMIT variable"; exit 1; fi

if [ -z "${SNOWPLOW_STREAM_ENRICH_KINESIS_STREAM_REGION}" ]; then echo "Missing SNOWPLOW_STREAM_ENRICH_KINESIS_STREAM_REGION variable"; exit 1; fi
if [ -z "${SNOWPLOW_STREAM_ENRICH_KINESIS_STREAM_APP_NAME}" ]; then echo "Missing SNOWPLOW_STREAM_ENRICH_KINESIS_STREAM_APP_NAME variable"; exit 1; fi
if [ -z "${SNOWPLOW_STREAM_ENRICH_KINESIS_STREAM_GOOD_NAME}" ]; then echo "Missing SNOWPLOW_STREAM_ENRICH_KINESIS_STREAM_GOOD_NAME variable"; exit 1; fi
if [ -z "${SNOWPLOW_STREAM_ENRICH_KINESIS_STREAM_BAD_NAME}" ]; then echo "Missing SNOWPLOW_STREAM_ENRICH_KINESIS_STREAM_BAD_NAME variable"; exit 1; fi
if [ -z "${SNOWPLOW_STREAM_ENRICH_KINESIS_STREAM_BACKOFF_MIN}" ]; then export SNOWPLOW_STREAM_ENRICH_KINESIS_STREAM_BACKOFF_MIN="3000"; fi
if [ -z "${SNOWPLOW_STREAM_ENRICH_KINESIS_STREAM_BACKOFF_MAX}" ]; export SNOWPLOW_STREAM_ENRICH_KINESIS_STREAM_BACKOFF_MAX="600000"; fi

if [ -z "${SNOWPLOW_STREAM_ENRICH_LOG_LEVEL}" ]; then export SNOWPLOW_STREAM_ENRICH_LOG_LEVEL="INFO"; fi

echo "Rendering configuration"
envsubst < /etc/snowplow/templates/snowplow-stream-enrich.hocon > /etc/snowplow/snowplow-stream-enrich.hocon
envsubst < /etc/snowplow/templates/resolver.json > /etc/snowplow/resolver.json

echo "Starting snowplow-stream-collector"
snowplow-stream-enrich --config /etc/snowplow/snowplow-stream-enrich.hocon ${${SNOWPLOW_STREAM_ENRICH_RESOLVER_DYNAMODB}}
