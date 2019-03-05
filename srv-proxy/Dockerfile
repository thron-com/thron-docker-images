FROM openresty/openresty:1.13.6.2-2-alpine
MAINTAINER Luca Tiozzo

EXPOSE 80

RUN ln -s /usr/local/openresty/nginx/sbin/nginx /usr/bin/nginx
COPY files/ /

ENTRYPOINT [ "/usr/local/openresty/bin/openresty", "-c", "/etc/nginx/nginx.conf" ]
