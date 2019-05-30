FROM alpine:3.6

ENV PROMETHEUS_VERSION=2.10.0

RUN mkdir -p /opt /etc/prometheus &&\
    apk add --update \
        bash \
		ca-certificates \
        python \
        py-pip \
		wget && \
    rm -rf /var/cache/apk/* && \
    pip install --no-cache-dir --upgrade --force-reinstall \
        awscli

RUN wget -O /opt/prometheus-${PROMETHEUS_VERSION}.tar.gz https://github.com/prometheus/prometheus/releases/download/v${PROMETHEUS_VERSION}/prometheus-${PROMETHEUS_VERSION}.linux-amd64.tar.gz && \
    tar zxvf /opt/prometheus-${PROMETHEUS_VERSION}.tar.gz -C /opt && \	
    cp -a /opt/prometheus-${PROMETHEUS_VERSION}.linux-amd64/prometheus                             /bin/prometheus && \
    cp -a /opt/prometheus-${PROMETHEUS_VERSION}.linux-amd64/promtool                               /bin/promtool && \
    cp -a /opt/prometheus-${PROMETHEUS_VERSION}.linux-amd64/prometheus.yml  /etc/prometheus/prometheus.yml && \
    cp -a /opt/prometheus-${PROMETHEUS_VERSION}.linux-amd64/console_libraries/                     /etc/prometheus/ && \
    cp -a /opt/prometheus-${PROMETHEUS_VERSION}.linux-amd64/consoles/                              /etc/prometheus/

COPY files/ /

RUN chmod +x /etc/docker/start.sh

EXPOSE     9090
VOLUME     [ "/prometheus" ]
WORKDIR    /prometheus
ENTRYPOINT [ "/etc/docker/start.sh" ]

