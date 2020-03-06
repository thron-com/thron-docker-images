FROM ubuntu:trusty
MAINTAINER THRON Devops <devops@thron.com>

ENV TERM="xterm" \
    NODEJS_ARCH="x64" \
    NODEJS_VERSION="5.12.0" \
    PATH=${PATH}:/opt/node/bin

RUN mkdir -p /opt && \
    apt-get update && \
    apt-get install -y \
        dos2unix \
        nano \
        iputils-ping \
        net-tools \
        wget && \
    wget \
        "http://nodejs.org/dist/v${NODEJS_VERSION}/node-v${NODEJS_VERSION}-linux-${NODEJS_ARCH}.tar.gz" \
        -O /tmp/node-v${NODEJS_VERSION}-linux-${NODEJS_ARCH}.tar.gz && \
    tar zxvf /tmp/node-v${NODEJS_VERSION}-linux-${NODEJS_ARCH}.tar.gz -C /opt && \
    ln -s /opt/node-v${NODEJS_VERSION}-linux-${NODEJS_ARCH} /opt/node && \
    ln /opt/node/bin/node /usr/local/bin/node && \
    echo "[INFO] Cleaning container" && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

CMD ["/bin/bash"]
