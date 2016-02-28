# Docker

A repo to host my Docker builds based on Centos 7.<br/>
See my <a href="https://registry.hub.docker.com/repos/dmoraschi/">Docker hub profile</a> for more information.

## Remove old not running containers
<code>
docker ps -a | awk '{print $1}' | xargs docker rm
</code>

## Delete all containers
<code>
docker rm $(docker ps -a -q)
</code>

## Delete all images
<code>
docker rmi $(docker images -q)
</code>

## License

MIT
