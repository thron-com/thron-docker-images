FROM thronspa/java:oracle-jre-7-79-xenial

MAINTAINER THRON DevOps <devops@thron.com>

ENV SNOWPLOW_COLLECTOR_VERSION=0.8.0

RUN    apt-get update \
    && apt-get install -y nano unzip dos2unix gettext-base \
    && echo "[INFO] Installing Snowplow" \
    && mkdir -p /opt \
    && mkdir -p /etc/snowplow/templates \
    && wget -S -O /opt/snowplow_scala_stream_collector_${SNOWPLOW_COLLECTOR_VERSION}.zip http://dl.bintray.com/snowplow/snowplow-generic/snowplow_scala_stream_collector_${SNOWPLOW_COLLECTOR_VERSION}.zip \
    && unzip /opt/snowplow_scala_stream_collector_${SNOWPLOW_COLLECTOR_VERSION}.zip -d /opt \
    && rm /opt/snowplow_scala_stream_collector_${SNOWPLOW_COLLECTOR_VERSION}.zip \
    && ln -sf /opt/snowplow-stream-collector-${SNOWPLOW_COLLECTOR_VERSION} /usr/bin/snowplow-stream-collector \
    && chmod +x /opt/snowplow-stream-collector-${SNOWPLOW_COLLECTOR_VERSION} \
    && echo "[INFO] Cleaning container" \
    && rm -rf /var/lib/apt/lists/* 

COPY files/etc/snowplow/templates/snowplow-stream-collector.hocon /etc/snowplow/templates/snowplow-stream-collector.hocon
COPY files/etc/docker/start.sh /etc/docker/start.sh

RUN chmod +x /etc/docker/start.sh && dos2unix /etc/docker/start.sh

EXPOSE 8080

ENTRYPOINT ["/etc/docker/start.sh"]
