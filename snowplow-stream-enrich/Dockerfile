FROM thronspa/java:oracle-jre-7-79-xenial

MAINTAINER THRON DevOps <devops@thron.com>

ENV SNOWPLOW_STREAM_ENRICH_VERSION=0.9.0

RUN    apt-get update \
    && apt-get install -y nano unzip dos2unix gettext-base \
    && echo "[INFO] Installing Snowplow" \
    && mkdir -p /opt \
    && mkdir -p /etc/snowplow/templates \
    && wget -S -O /opt/snowplow_stream_enrich_${SNOWPLOW_STREAM_ENRICH_VERSION}.zip http://dl.bintray.com/snowplow/snowplow-generic/snowplow_stream_enrich_${SNOWPLOW_STREAM_ENRICH_VERSION}.zip \
    && unzip /opt/snowplow_stream_enrich_${SNOWPLOW_STREAM_ENRICH_VERSION}.zip -d /opt \
    && rm /opt/snowplow_stream_enrich_${SNOWPLOW_STREAM_ENRICH_VERSION}.zip \
    && ln -sf /opt/snowplow-stream-enrich-${SNOWPLOW_STREAM_ENRICH_VERSION} /usr/bin/snowplow-stream-enrich \
    && chmod +x /opt/snowplow-stream-enrich-${SNOWPLOW_STREAM_ENRICH_VERSION} \
    && echo "[INFO] Cleaning container" \
    && rm -rf /var/lib/apt/lists/*

COPY files/etc/snowplow/templates/snowplow-stream-enrich.hocon /etc/snowplow/templates/snowplow-stream-enrich.hocon
COPY files/etc/docker/start.sh /etc/docker/start.sh

RUN chmod +x /etc/docker/start.sh && dos2unix /etc/docker/start.sh

EXPOSE 8080

#ENTRYPOINT ["/etc/docker/start.sh"]
ENTRYPOINT ["/etc/docker/start.sh"]



