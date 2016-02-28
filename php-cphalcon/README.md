# Nginx

Php FPM container based on Centos 7 with PhalconPHP extension enabled

## How to Pull from Docker Hub

    docker pull dmoraschi/centos-phpcphalcon

## How to Build

    git clone https://github.com/dmoraschi/docker-centos.git
    cd docker-centos/php-cphalcon
    docker build -t dmoraschi/centos-phpcphalcon .

## How to Run

    docker run --name myapp-php \
            -v /var/www/myapp:/data/app -d dmoraschi/centos-phpcphalcon

## How to use it along with `dmoraschi/app-volume` and `dmoraschi/centos-nginx` containers

    APP_NAME=<your app name>
    APP_ROOT=<your app root folder>
    APP_WEB=<your app web port>

    docker run -tid --name ${APP_NAME}-app \
        -v ${APP_ROOT}:/data/app dmoraschi/app-volume

    docker run --name ${APP_NAME}-php \
        --volumes-from ${APP_NAME}-app -d dmoraschi/centos-phpcphalcon

    docker run --name ${APP_NAME}-nginx \
        --volumes-from ${APP_NAME}-app -p ${APP_WEB}:80 \
        --link ${APP_NAME}-php:fpm -d dmoraschi/centos-nginx

## License

MIT
