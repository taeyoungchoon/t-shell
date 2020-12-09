all:
	@cat makefile | grep ^[a-z]*:

check:
	@grep proxy /etc/yum.conf
	@ss -lntpu | grep squid | grep 3128

config:
	sh config.sh

clean:
	rm yum.conf*
