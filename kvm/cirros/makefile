all: help

help:
	grep ^[a-z] makefile
download:
	sh cirros-download.sh
check:
	virsh list --all
	virsh domiflist ci0
	virsh domifaddr ci0
	sh uptime.sh
install:
	sh cirros.sh
clean:
	sh cirros-clean.sh
