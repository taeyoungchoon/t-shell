all: download install

download:
	sh cirros-download.sh
check:
	virsh list --all
install:
	sh cirros.sh
clean:
	sh cirros-clean.sh
