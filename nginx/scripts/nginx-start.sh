#!/bin/bash
#sed -i "s/%fpm-ip%/$FPM_PORT_9000_TCP_ADDR/" /etc/nginx/conf.d/default.conf

exec /usr/sbin/nginx
