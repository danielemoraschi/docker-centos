# PHP Composer

A Docker image for the Composer command line interface, based on `dmoraschi/centos-php`

## How to Pull from Docker Hub

    docker pull dmoraschi/centos-phpcomposer

## How to Build

    git clone https://github.com/dmoraschi/docker-centos.git
    cd docker-centos/php-composer
    docker build -t dmoraschi/centos-phpcomposer .

## How to Run (required a php fpm image to link)

    docker run -v /var/www/myapp:/data/app \
        --rm dmoraschi/centos-phpcomposer `your composer command here`

Example:

    docker run -v /var/www/myapp:/data/app \
        --rm dmoraschi/centos-phpcomposer create-project symfony/framework-standard-edition


## How to Run along with `dmoraschi/app-volume` container

    APP_NAME=<your app name>
    APP_ROOT=<your app root folder>

    docker run -tid --name ${APP_NAME}-app \
        -v ${APP_ROOT}:/data/app dmoraschi/app-volume

    docker run --volumes-from ${APP_NAME}-app \
        --rm dmoraschi/centos-phpcomposer create-project symfony/framework-standard-edition


## License

MIT
