# Pure data volume container

This image is meant to be used as "data-only" container,
which will be used to give access to our app's files to the other linked containers.

Available volumes:

- /data/app
- /data/log

## How to Pull from Docker Hub

    docker pull dmoraschi/app-volume

## How to Build

    git clone https://github.com/dmoraschi/docker-centos.git
    cd docker-centos/app-volume
    docker build -t dmoraschi/app-volume .

## How to Run

    APP_NAME=<your app name>
    APP_ROOT=<your app root folder>

    docker run -rm --name ${APP_NAME}-app \
        -v ${APP_ROOT}:/data/app dmoraschi/app-volume

## License

MIT
