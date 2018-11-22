#!/usr/bin/env bash

echo "PROMETHEUS_CONF_URI: set the prometheus URI configuration"
echo "PROMETHEUS_RETENTION: set the prometheus retention. The default value i 15d"

if [ -z "${PROMETHEUS_RETENTION}" ]; then 
  echo "Using PROMETHEUS_RETENTION='90d'"
  PROMETHEUS_RETENTION="90d" 
fi


if [ "${PROMETHEUS_CONF_URI}" ]; then
  if [[ $PROMETHEUS_CONF_URI =~ s3://.+ ]]; then
    echo "Downloading file from S3"
	aws s3 cp $PROMETHEUS_CONF_URI /etc/prometheus/prometheus.yml || exit 1
  elif [[ $PROMETHEUS_CONF_URI =~ https?://.+ ]]; then
    echo "Downloading file from HTTP/HTTPS"
	wget -O /etc/prometheus/prometheus.yml $PROMETHEUS_CONF_URI || exit 1
  else
    echo "Protocol not recognized"
	exit 1
  fi
else
  echo "Using default Prometheus configuration"
fi

exec /bin/prometheus \
  --config.file=/etc/prometheus/prometheus.yml \
  --web.external-url=/management/prometheus \
  --storage.tsdb.retention=${PROMETHEUS_RETENTION} \
  --storage.tsdb.path=/prometheus \
  --web.console.libraries=/etc/prometheus/console_libraries \
  --web.console.templates=/etc/prometheus/consoles