# snowplow-stream-collector

The container uses the default AWS authentication chain.
If you want to specify the credentials via environment variable (`AWS_ACCESS_KEY_ID` and `AWS_SECRET_ACCESS_KEY`) 
you can pass it in the docker run command, otherwise you can omit them.

Here follows and example how to launch the container:

```
docker run \
  -e "AWS_ACCESS_KEY_ID=xxx" \
  -e "AWS_SECRET_ACCESS_KEY=yyy" \
  -e "SNOWPLOW_COLLECTOR_COOKIE_NAME=sp" \
  -e "SNOWPLOW_COLLECTOR_COOKIE_DOMAIN=365 days" \
  -e "SNOWPLOW_COLLECTOR_SINK_KINESIS_STREAM_REGION=eu-west-1" \
  -e "SNOWPLOW_COLLECTOR_SINK_KINESIS_STREAM_GOOD_NAME=sp-good" \
  -e "SNOWPLOW_COLLECTOR_SINK_KINESIS_STREAM_BAD_NAME=sp-bad" \
  -e "SNOWPLOW_COLLECTOR_SINK_KINESIS_MIN_BACKOFF_MILLIS=3000" \
  -e "SNOWPLOW_COLLECTOR_SINK_KINESIS_MAX_BACKOFF_MILLIS=600000" \
  -e "SNOWPLOW_COLLECTOR_SINK_BUFFER_BYTE_THRESHOLD=1048576" \
  -e "SNOWPLOW_COLLECTOR_SINK_BUFFER_RECORD_THRESHOLD=100" \
  -e "SNOWPLOW_COLLECTOR_SINK_BUFFER_TIME_THRESHOLD=60" \
  -it thronspa/snowplow-stream-collector:0.8.0
```


