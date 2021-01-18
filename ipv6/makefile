check:
	@find /proc/sys/net/ipv6/conf -name disable_ipv6 -exec ls {} > /tmp/front \;
	@find /proc/sys/net/ipv6/conf -name disable_ipv6 -exec cat {} > /tmp/back \;
	@paste /tmp/front /tmp/back | sed -e 's!/proc/sys/net/ipv6/conf/!!' -e 's!/disable_ipv6!!' 
	@echo 
	@echo 0 : enabled
	@echo 1 : disabled
	@echo 
	@ip -6 a
disable:
	# echo 1 > /proc/sys/net/ipv6/conf/all/disable_ipv6
	sysctl -w net.ipv6.conf.all.disable_ipv6=1
enable:
	# echo 0 > /proc/sys/net/ipv6/conf/all/disable_ipv6
	sysctl -w net.ipv6.conf.all.disable_ipv6=0
