FROM thronspa/java:oracle-jre-7-79-xenial

MAINTAINER THRON DevOps <devops@thron.com>

ENV SNOWPLOW_KINESIS_S3_VERSION=0.4.0

RUN    apt-get update \
    && apt-get install -y nano unzip dos2unix gettext-base \
    && echo "[INFO] Installing Snowplow" \
    && mkdir -p /opt \
    && mkdir -p /etc/snowplow/templates \
    && wget -S -O /opt/snowplow_kinesis_s3_${SNOWPLOW_KINESIS_S3_VERSION}.zip http://dl.bintray.com/snowplow/snowplow-generic/kinesis_s3_${SNOWPLOW_KINESIS_S3_VERSION}.zip \
    && unzip /opt/snowplow_kinesis_s3_${SNOWPLOW_KINESIS_S3_VERSION}.zip -d /opt \
    && rm /opt/snowplow_kinesis_s3_${SNOWPLOW_KINESIS_S3_VERSION}.zip \
    && ln -sf /opt/snowplow-kinesis-s3-${SNOWPLOW_KINESIS_S3_VERSION} /usr/bin/snowplow-kinesis-s3 \
    && chmod +x /opt/snowplow-kinesis-s3-${SNOWPLOW_KINESIS_S3_VERSION} \
    && echo "[INFO] Cleaning container" \
    && rm -rf /var/lib/apt/lists/*

COPY files/etc/snowplow/templates/snowplow-kinesis-s3.hocon /etc/snowplow/templates/snowplow-kinesis-s3.hocon
COPY files/etc/docker/start.sh /etc/docker/start.sh

RUN chmod +x /etc/docker/start.sh && dos2unix /etc/docker/start.sh

EXPOSE 8080

#ENTRYPOINT ["/etc/docker/start.sh"]
ENTRYPOINT ["/etc/docker/start.sh"]



