# Pure data volume container

This image is meant to be used as "data-only" container,
which will be used to give access to our app's files to the other linked containers.

Available volumes:

- /data/app
- /data/log

## How to Pull from Docker Hub

    docker pull dmoraschi/docker-data

## How to Build

    git clone https://github.com/dmoraschi/docker-centos.git
    cd app-volume
    docker build -t dmoraschi/app-volume .

## How to Run

    APP_NAME=<your app name>
    APP_ROOT=<your app root folder>

    docker run -tid --name ${APP_NAME}-app \
        -v ${APP_ROOT}/app:/data/app -v ${APP_ROOT}/log:/data/log dmoraschi/app-volume

## License

MIT