# Nginx

Php FPM container based on Centos 7

Installed extensions:

- php
- php-common
- php-cli
- php-devel
- php-dom
- php-fpm
- php-gd
- php-ldap
- php-mcrypt
- php-mysql
- php-opcache
- php-redis
- php-soap
- php-xml
- php-xmlrpc
- php-pear
- php-pdo
- php-pear
- php-phpunit
- php-pecl-mongo
- php-pecl-memcache
- php-pecl-memcached
- php-pecl-igbinary
- php-php-gettext
- apc

## How to Pull from Docker Hub

    docker pull dmoraschi/centos-php

## How to Build

    git clone https://github.com/dmoraschi/docker-centos.git
    cd docker-centos/php
    docker build -t dmoraschi/centos-php .

## How to Run

    docker run --name myapp-php \
            -v /var/www/myapp:/data/app -d dmoraschi/centos-php

## How to Run along with `dmoraschi/app-volume` and `dmoraschi/centos-nginx` containers

    APP_NAME=<your app name>
    APP_ROOT=<your app root folder>
    APP_WEB=<your app web port>

    docker run -tid --name ${APP_NAME}-app \
        -v ${APP_ROOT}:/data/app dmoraschi/app-volume

    docker run --name ${APP_NAME}-php \
        --volumes-from ${APP_NAME}-app -d dmoraschi/centos-php

    docker run --name ${APP_NAME}-nginx \
        --volumes-from ${APP_NAME}-app -p ${APP_WEB}:80 \
        --link ${APP_NAME}-php:fpm -d dmoraschi/centos-nginx

## License

MIT
