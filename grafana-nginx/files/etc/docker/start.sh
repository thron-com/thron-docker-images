#!/usr/bin/env sh

echo "GRAFANA_PATH: set the grafana path"
echo "GRAFANA_ENDPOINT: set the grafana url endpoint"

if [ -z "${GRAFANA_PATH}" ]; then
  GRAFANA_PATH="/"
elif echo "GRAFANA_PATH" | sed -n '/.*\/$/p'; then
  GRAFANA_PATH=$(echo "$GRAFANA_PATH" | sed -E 's/(.*)\/$/\1/g')
fi

if [ -z "${GRAFANA_ENDPOINT}" ]; then
  GRAFANA_ENDPOINT="http://grafana:3000/"
elif echo "$GRAFANA_ENDPOINT" | sed -n '/.*[^\/]{1}$/p'; then
  GRAFANA_ENDPOINT="${GRAFANA_ENDPOINT}/"
fi

echo "using GRAFANA_PATH: ${GRAFANA_PATH}"
echo "using GRAFANA_ENDPOINT: ${GRAFANA_ENDPOINT}"

envsubst < /etc/nginx/template/conf.d/default.conf > /etc/nginx/conf.d/default.conf


exec nginx -g "daemon off;"

