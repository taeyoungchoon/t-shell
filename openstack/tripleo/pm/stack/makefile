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
	# sh t-image-download.sh
	sh t-image-build.sh
	# bash t-image-up.sh
clean:
	rm *~
