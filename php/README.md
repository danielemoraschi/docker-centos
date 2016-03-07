# Nginx

Php FPM container based on Centos 7

Installed extensions:

- php56w
- php56w-cli
- php56w-common
- php56w-devel
- php56w-fpm
- php56w-gd
- php56w-imap
- php56w-intl
- php56w-ldap
- php56w-mbstring
- php56w-mcrypt
- php56w-mysqlnd
- php56w-odbc
- php56w-opcache
- php56w-pdo
- php56w-pear
- php56w-pecl-apcu
- php56w-pecl-igbinary
- php56w-pecl-imagick
- php56w-pecl-memcache
- php56w-pecl-memcached
- php56w-pecl-redis
- php56w-pecl-xdebug
- hp56w-opcache
- php56w-process
- php56w-soap
- php56w-xml
- php56w-xmlrpc
- php-php-gettext
- php56w-pecl-gearman


Other Extensions:

- PHPUnit
- apc
- Mongodb
- Composer

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
-
