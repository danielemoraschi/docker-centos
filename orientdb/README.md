# OrientDB container based on Centos 7

## How to Pull from Docker Hub

    docker pull dmoraschi/docker-orientdb

## How to Build

    git clone https://github.com/dmoraschi/docker-orientdb.git
    cd docker-orientdb
    docker build -t dmoraschi/centos-orientdb .

## How to Run

    docker run --name orientdb -d -p 2480:2480 -p 2424:2424 dmoraschi/centos-orientdb

## How to get the root password

    docker exec xxxxxxxx cat /opt/orientdb/config/orientdb-server-config.xml

## License

MIT