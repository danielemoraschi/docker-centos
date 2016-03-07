#cd /mnt/sda1/var/lib/docker/containers
#find . -type f -name "*.log" -exec rm -f {} \;

define build
    cd $(shell pwd)/$1; \
	docker build -t dmoraschi/$2 .
endef

define push
    docker push dmoraschi/$1
endef

base:
	$(call build,centos7,centos7)

volume: base
	$(call build,app-volume,app-volume)

web: base
	$(call build,centos7,centos7)
	$(call build,nginx,centos-nginx)
	$(call build,php,centos-php)
	$(call build,php-cphalcon,php-cphalcon)

gearmand: base
	$(call build,gearmand,centos-gearmand)

orientdb: base
	$(call build,centos7,centos7)
	$(call build,centos-openjdk1.7,centos-openjdk7)
	$(call build,orientdb,centos-orientdb)

.PHONY: orientdb web volume base
