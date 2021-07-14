all: install

install: pkg config undercloud

pkg:
	sh t-pkg.sh
	sh t-completion.sh
config:
	sh t-config.sh
undercloud:
	cd ~/
	openstack undercloud install
deploy: overcloud

overcloud:
	bash t-image.sh
clean:
	rm *~
