RM = rm

ifneq ("$(wildcard *~)","")
        FILE_EXISTS = 1
else
        FILE_EXISTS = 0
endif

.PHONY: all
all: ping

.PHONY: ping
ping:
	python t-ping.py
	python t-ping.py 168.126.63.1

.PHONY: clean
clean:
ifeq ("$(FILE_EXISTS)","1")
	$(RM) *~
else
	@echo nothing to clean
endif
