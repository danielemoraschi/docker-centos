# Nginx

Nginx container based on Centos 7

## How to Pull from Docker Hub

    docker pull dmoraschi/centos-nginx

## How to Build

    git clone https://github.com/dmoraschi/docker-centos.git
    cd docker-centos/nginx
    docker build -t dmoraschi/centos-nginx .

## How to Run (required a php fpm image to link)

    docker run --name myapp-nginx -v /var/www/myapp:/data/app \
        -p 80:80 --link php-fpm-image:fpm -d dmoraschi/centos-nginx

## How to Run along with `dmoraschi/app-volume` and `dmoraschi/centos-php` containers

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
