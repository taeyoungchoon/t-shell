help:
	cat makefile | grep ^[a-z]
download:
	@echo 'cEOS-lab-4.21.14M.tar.xz required'
import:
	docker import cEOS-lab-4.21.14M.tar.xz ceosimage:4.21.14M
create:
	docker create --name=ceos1 --privileged -e INTFTYPE=eth -e ETBA=1 -e SKIP_ZEROTOUCH_BARRIER_IN_SYSDBINIT=1 -e CEOS=1 -e EOS_PLATFORM=ceoslab -e container=docker -i -t ceosimage:4.21.14M /sbin/init systemd.setenv=INTFTYPE=eth systemd.setenv=ETBA=1 systemd.setenv=SKIP_ZEROTOUCH_BARRIER_IN_SYSDBINIT=1 systemd.setenv=CEOS=1 systemd.setenv=EOS_PLATFORM=ceoslab systemd.setenv=container=docker
	docker create --name=ceos2 --privileged -e INTFTYPE=eth -e ETBA=1 -e SKIP_ZEROTOUCH_BARRIER_IN_SYSDBINIT=1 -e CEOS=1 -e EOS_PLATFORM=ceoslab -e container=docker -i -t ceosimage:4.21.14M /sbin/init systemd.setenv=INTFTYPE=eth systemd.setenv=ETBA=1 systemd.setenv=SKIP_ZEROTOUCH_BARRIER_IN_SYSDBINIT=1 systemd.setenv=CEOS=1 systemd.setenv=EOS_PLATFORM=ceoslab systemd.setenv=container=docker

network:
	docker network create net1
	docker network create net2
connect:
	docker network connect net1 ceos1
	docker network connect net1 ceos2
	docker network connect net2 ceos1
	docker network connect net2 ceos2
start:
	docker start ceos1
	docker start ceos2
status:
	docker ps -a
	docker network ls
	docker images
check: status
go: import create network connect start
back: stop rm rmi clean_network
c1:
	docker exec -it ceos1 Cli
c2:
	docker exec -it ceos2 Cli
stop:
	docker stop ceos1
	docker stop ceos2
rm:
	docker rm ceos1
	docker rm ceos2
rmi:
	docker rmi ceosimage:4.21.14M

clean_network:
	docker network rm net1
	docker network rm net2

log:
	docker logs -n 10 ceos1 | grep Interface
	docker logs -n 10 ceos2 | grep Interface

watch:
	watch make log
