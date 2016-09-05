FROM ubuntu:16.04

MAINTAINER THRON Devops <devops@thron.com>

ENV JAVA_VERSION_MAJOR=1 \
    JAVA_VERSION_MINOR=8 \
    JAVA_VERSION_MAINTENANCE=0 \
    JAVA_VERSION_PATCH=102 \
    JAVA_VERSION_BUILD=14 \
    JAVA_HOME=/usr/lib/jvm/default \
    PATH=${PATH}:/usr/lib/jvm/default/bin

RUN    apt-get update \
    && apt-get install -y wget \
    && mkdir -p /opt \
    && mkdir -p /usr/lib/jvm \
    && wget \
         --no-check-certificate \
         --header="Cookie: oraclelicense=accept-securebackup-cookie"  \
         "http://download.oracle.com/otn-pub/java/jdk/${JAVA_VERSION_MINOR}u${JAVA_VERSION_PATCH}-b${JAVA_VERSION_BUILD}/jre-${JAVA_VERSION_MINOR}u${JAVA_VERSION_PATCH}-linux-x64.tar.gz" \
         -O /tmp/java.tar.gz \
    && tar -xzvf /tmp/java.tar.gz -C /usr/lib/jvm \
    && rm /tmp/java.tar.gz \
    && rm -rf /var/lib/apt/lists/* \
    && ln -s /usr/lib/jvm/jre${JAVA_VERSION_MAJOR}.${JAVA_VERSION_MINOR}.${JAVA_VERSION_MAINTENANCE}_${JAVA_VERSION_PATCH} ${JAVA_HOME} \
    && ln -s /usr/lib/jvm/jre${JAVA_VERSION_MAJOR}.${JAVA_VERSION_MINOR}.${JAVA_VERSION_MAINTENANCE}_${JAVA_VERSION_PATCH}/bin/java /usr/bin/java


CMD ["/bin/sh"]
