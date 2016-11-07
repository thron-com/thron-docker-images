#!/bin/bash

if [ -z "${SNOWPLOW_COLLECTOR_COOKIE_EXPIRATION}" ]; then export SNOWPLOW_COLLECTOR_COOKIE_EXPIRATION="365 days"; fi

if [ -z "${SNOWPLOW_COLLECTOR_COOKIE_NAME}" ]; then echo "Missing SNOWPLOW_COLLECTOR_COOKIE_NAME variable"; exit 1; fi
if [ -z "${SNOWPLOW_COLLECTOR_COOKIE_DOMAIN}" ]; then echo "Missing SNOWPLOW_COLLECTOR_COOKIE_DOMAIN variable"; exit 1; fi
if [ -z "${SNOWPLOW_COLLECTOR_SINK_KINESIS_STREAM_REGION}" ]; then echo "Missing SNOWPLOW_COLLECTOR_SINK_KINESIS_STREAM_REGION variable"; exit 1; fi
if [ -z "${SNOWPLOW_COLLECTOR_SINK_KINESIS_STREAM_GOOD_NAME}" ]; then echo "Missing SNOWPLOW_COLLECTOR_SINK_KINESIS_STREAM_GOOD_NAME variable"; exit 1; fi
if [ -z "${SNOWPLOW_COLLECTOR_SINK_KINESIS_STREAM_BAD_NAME}" ]; then echo "Missing SNOWPLOW_COLLECTOR_SINK_KINESIS_STREAM_BAD_NAME variable"; exit 1; fi

if [ -z "${SNOWPLOW_COLLECTOR_SINK_KINESIS_MIN_BACKOFF_MILLIS}" ]; then echo "Missing SNOWPLOW_COLLECTOR_SINK_KINESIS_MIN_BACKOFF_MILLIS variable"; exit 1; fi
if [ -z "${SNOWPLOW_COLLECTOR_SINK_KINESIS_MAX_BACKOFF_MILLIS}" ]; then echo "Missing SNOWPLOW_COLLECTOR_SINK_KINESIS_MAX_BACKOFF_MILLIS variable"; exit 1; fi
if [ -z "${SNOWPLOW_COLLECTOR_SINK_BUFFER_BYTE_THRESHOLD}" ]; then echo "Missing SNOWPLOW_COLLECTOR_SINK_BUFFER_BYTE_THRESHOLD variable"; exit 1; fi
if [ -z "${SNOWPLOW_COLLECTOR_SINK_BUFFER_RECORD_THRESHOLD}" ]; then echo "Missing SNOWPLOW_COLLECTOR_SINK_BUFFER_RECORD_THRESHOLD variable"; exit 1; fi
if [ -z "${SNOWPLOW_COLLECTOR_SINK_BUFFER_TIME_THRESHOLD}" ]; then echo "Missing SNOWPLOW_COLLECTOR_SINK_BUFFER_TIME_THRESHOLD variable"; exit 1; fi

echo "Rendering configuration"
envsubst < /etc/snowplow/templates/snowplow-stream-collector.hocon > /etc/snowplow/snowplow-stream-collector.hocon

echo "Starting snowplow-stream-collector"
snowplow-stream-collector --config /etc/snowplow/snowplow-stream-collector.hocon

