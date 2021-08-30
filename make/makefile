#
# todo: recursion
#
.PHONY: all clean
hello = hello, world!
RM = rm
CAT = cat
DF = df
DF_OPTIONS = -Pk
UPTIME = uptime

ifneq ("$(wildcard *~)","")
	FILE_EXISTS = 1
else
	FILE_EXISTS = 0
endif

all: uptime

help: 
	@$(CAT) makefile | grep ^[a-z]*: | cut -d ":" -f 1 |sed 's/^/- /'

hi:
	@echo $(hello)

disk_space:
	@$(DF) $(DF_OPTIONS) |  grep dev

uptime:
	@$(UPTIME)

check: $(wildcard *~)
	@ls -al $?

clean: 
ifeq ("$(FILE_EXISTS)","1")
	$(RM) *~
endif
	@echo nothing to clean
