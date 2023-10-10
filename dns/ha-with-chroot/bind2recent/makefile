help:
	cat makefile | grep ^[a-z]
check:
	rpm -qa | grep bind
uninstall-bind:
	yum remove bind-chroot bind-utils
install-bind9.16:
	yum localinstall -y rpms/*.rpm
