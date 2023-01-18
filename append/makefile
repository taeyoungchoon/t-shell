help:
	@cat makefile | grep ^[a-z]
all: go
go:
	sh gen.sh
	sh appending.sh
check:
	diff -u ever later
clean:
	rm data.out later 
