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
MAINTAINER THRON Infrastructure <dam-infrastructure@thron.com>

RUN install_packages ca-certificates gnupg wget && \
    wget -qO - https://openresty.org/package/pubkey.gpg | apt-key add - && \
    OS_ID=$(egrep -r "^ID=" /etc/os-release | sed -r "s/^.*=([a-z]+)$/\\1/") && \
    OS_CODENAME=$(egrep -r "^VERSION=" /etc/os-release | sed -r "s/^.*=.*\(([a-z]+)\).*/\\1/") && \
    echo "deb http://openresty.org/package/${OS_ID} ${OS_CODENAME} openresty" > /etc/apt/sources.list.d/openresty.list && \
    install_packages openresty

COPY conf/ /

RUN mkdir -p /var/www/ && \
    chown www-data:www-data /var/www/ && \
    chmod 644 /etc/openresty/nginx.conf && \
    chmod 755 /docker-run.sh

WORKDIR /var/www

CMD /docker-run.sh
