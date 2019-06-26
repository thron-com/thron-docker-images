# Copyright (C) 2019 THRON S.p.A.
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

FROM bitnami/minideb:stretch
MAINTAINER Andrea Mandolo <andrea.mandolo@thron.com>

RUN install_packages \
       ca-certificates \
       procps \
       apt-transport-https \
       gnupg \
       htop \
       inetutils-ping \
       jq \
       nano \
       net-tools \
       iproute2 \
       python3-pip \
       software-properties-common \
       supervisor \
       wget \
       gettext-base \
    && wget -q https://packages.sury.org/php/apt.gpg -O- | apt-key add - \
    && echo "deb https://packages.sury.org/php/ stretch main" | tee /etc/apt/sources.list.d/php.list \
    && install_packages php5.6-curl php5.6-dev php5.6-fpm php5.6-gd php5.6-mcrypt php5.6-xdebug php5.6-xml php5.6-zip \
    && wget -qO - https://openresty.org/package/pubkey.gpg | apt-key add - \
    && add-apt-repository -y "deb http://openresty.org/package/debian $(lsb_release -sc) openresty" \
    && apt update \
    && install_packages openresty

RUN pip3 install -I setuptools \
    && pip3 install -I awscli j2cli

COPY files/ /

RUN mkdir -p /var/www/ /run/php \
    && ln -s /usr/local/openresty/nginx/conf/ /etc/nginx \
    && rm /etc/nginx/*.default /etc/nginx/fastcgi_params \
    && ln -s /etc/nginx/fastcgi.conf /etc/nginx/fastcgi_params \
    && chown www-data:www-data /var/www/ \
    && chmod 755 /etc/docker/start.sh \
    && chmod 644 /etc/supervisor/supervisord.conf \
    && chmod 644 /etc/openresty/nginx.conf \
    && chmod 644 /etc/php5/fpm/php.ini \
    && chmod 644 /etc/php5/fpm/php-fpm.conf \
    && chmod 644 /etc/php5/fpm/pool.d/www.conf \
    && chmod 644 /etc/php5/mods-available/http.ini

CMD ["/etc/docker/start.sh"]
