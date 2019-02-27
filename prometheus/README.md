# Prometheus

The container support the following environment variable:
* `PROMETHEUS_CONF_URI` to set the URL to use to download the configuration. Is supported the `s3` and `http` protocol.
* `PROMETHEUS_RETENTION` the data retention. For example `30d` for 30 days retention
* `PROMETHEUS_WEB_EXTERNAL_URL` the Prometheus external URL
* `PROMETHEUS_PATH` the Prometheus path of db
