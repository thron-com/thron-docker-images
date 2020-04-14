FROM grafana/grafana:6.7.2

USER root
WORKDIR /
RUN apk add --no-cache py-pip dos2unix && pip install awscli
COPY init.sh init.sh
RUN dos2unix init.sh
ENTRYPOINT [ "./init.sh" ]