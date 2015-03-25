#!/bin/bash
sed -i "s/%fpm-ip%/$FPM_PORT_9000_TCP_ADDR/" /etc/nginx/conf.d/app.conf

mkdir -p /data/log/nginx
mkdir -p /data/app/public

exec /usr/sbin/nginx