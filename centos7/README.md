# Centos7

A base image for the official CentOS distribution (`centos:7`) coming with:

- EPEL repository
- vim
- git
- gcc
- make
- curl
- sudo

## How to Pull from Docker Hub

    docker pull dmoraschi/centos7

## How to Build

    git clone https://github.com/dmoraschi/docker-centos7.git
    cd docker-centos7
    docker build -t dmoraschi/centos7 .

## License

MIT