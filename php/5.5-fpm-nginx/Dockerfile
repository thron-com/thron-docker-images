# Copyright (C) 2016 THRON S.p.A.
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
# 
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
# 
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

FROM ubuntu:trusty
MAINTAINER THRON Devops <devops@thron.com>

ENV TERM=xterm \
    PATH=${PATH}:/usr/lib/jvm/default/bin

RUN    apt-get update \
    && apt-get install -y \
          wget \
          nano \
          iputils-ping \
          net-tools \
          nginx \
          openssh-server \
          php5-fpm \
          php5-dev \
          php5-curl \
          php5-xdebug \
          php-pear \
          php5-ldap \
          php5-mcrypt \
          php5-gd \
          supervisor \
    && echo "[INFO] Nginx conf" \
    && mkdir -p /var/www/ \
    && echo "[INFO] Cleaning container" \
    && rm -rf /var/lib/apt/lists/* 

COPY files/etc/docker/start.sh /etc/docker/start.sh
COPY files/etc/supervisor/supervisord.conf /etc/supervisor/supervisord.conf
COPY files/etc/nginx/nginx.conf /etc/nginx/nginx.conf
COPY files/etc/php5/fpm/php.ini /etc/php5/fpm/php.ini
COPY files/etc/php5/fpm/php-fpm.conf /etc/php5/fpm/php-fpm.conf
COPY files/etc/php5/fpm/pool.d/www.conf /etc/php5/fpm/pool.d/www.conf
COPY files/etc/php5/mods-available/http.ini /etc/php5/mods-available/http.ini

RUN    chmod 755 /etc/docker/start.sh \
    && chmod 644 /etc/supervisor/supervisord.conf \
    && chmod 644 /etc/nginx/nginx.conf \
    && chmod 644 /etc/php5/fpm/php.ini \
    && chmod 644 /etc/php5/fpm/php-fpm.conf \
    && chmod 644 /etc/php5/fpm/pool.d/www.conf \
    && chmod 644 /etc/php5/mods-available/http.ini 


    
CMD ["/etc/docker/start.sh"]
