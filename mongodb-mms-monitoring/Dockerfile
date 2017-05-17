FROM ubuntu:xenial
MAINTAINER THRON Devops <devops@thron.com>

ENV TERM=xterm \
    MONGODB_MMS_MONITORING_ARCH=x86_64

USER root

RUN apt-get update && apt-get install -y \
      libsasl2-2 \
      gettext \
      nano \
      wget && \
    mkdir -p /opt && \
    wget --no-check-certificate -O /opt/mongodb-mms-monitoring-agent-latest.linux_${MONGODB_MMS_MONITORING_ARCH}.tar.gz https://cloud.mongodb.com/download/agent/monitoring/mongodb-mms-monitoring-agent-latest.linux_${MONGODB_MMS_MONITORING_ARCH}.tar.gz && \
    tar zxvf /opt/mongodb-mms-monitoring-agent-latest.linux_${MONGODB_MMS_MONITORING_ARCH}.tar.gz -C /opt/ && \
    ln /opt/mongodb-mms-monitoring-agent-*.linux_${MONGODB_MMS_MONITORING_ARCH}/mongodb-mms-monitoring-agent /usr/bin/mongodb-mms-monitoring-agent && \
    rm /opt/mongodb-mms-monitoring-agent-latest.linux_${MONGODB_MMS_MONITORING_ARCH}.tar.gz && \
    echo "[INFO] Cleaning container" && \
    rm -rf /var/lib/apt/lists/*

COPY files/ /

RUN chmod +x /etc/docker/* 

ENTRYPOINT ["/etc/docker/start"]