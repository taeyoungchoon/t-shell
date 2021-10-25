all: help

help:
	grep ^[a-z] makefile
download:
	sh download.sh
check:
	virsh list --all
	virsh domiflist c0
	virsh domifaddr c0
	sh uptime.sh
install:
	sh centos8.sh
clean:
	sh clean.sh
