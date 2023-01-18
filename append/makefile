all: 
	sh appending.sh
help:
	@cat makefile | grep ^[a-z]
check:
	@[ -e after ] && diff -u before after && echo checking || echo 'nothing to do' || true
clean:
	@[ -e after ] && rm after && echo cleaning|| echo 'nothing to do' || true
