cat yum.conf.orig | grep proxy >/dev/null 2>/dev/null
if test $? -ne 0; then
	echo "no proxy"
	cp /etc/yum.conf yum.conf.orig
	cp yum.conf.orig yum.conf.mod
	echo "proxy=http://127.0.0.1:3128" >> yum.conf.mod
	cp yum.conf.mod /etc/yum.conf
	yum clean all
fi
