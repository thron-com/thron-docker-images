#!/bin/bash

echo "** Starting OPENRESTY **"
exec "/usr/bin/openresty" -c "/etc/openresty/nginx.conf"