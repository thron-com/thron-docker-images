FROM nginx:1.14.1-alpine

COPY files/ /

RUN chmod +x /etc/docker/start.sh

EXPOSE     80
ENTRYPOINT [ "/etc/docker/start.sh" ]

