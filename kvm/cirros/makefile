all: help

help:
	grep ^[a-z] makefile
download:
	sh cirros-download.sh
check:
	virsh list --all
install:
	sh cirros.sh
clean:
	sh cirros-clean.sh
