
all: ls upgrade

help:
	@cat makefile | egrep "^[a-z]+:"

ls:
	@choco list -l | \
	egrep -v ".install|.app|.portable|.extension|vcredist|^KB|installed" | \
       	python -c "import sys; [print(line.split()[0]) for line in sys.stdin]"
upgrade:
	@choco upgrade all -y

# If the first argument is "run"...
ifeq (search, $(firstword $(MAKECMDGOALS)))
  # use the rest as arguments for "search"
  RUN_ARGS := $(wordlist 2, $(words $(MAKECMDGOALS)), $(MAKECMDGOALS))
  # ...and turn them into do-nothing targets
  $(eval $(RUN_ARGS):;@:)
endif

.PHONY: search
search: 
	@echo help: make search vlc
	@choco search $(RUN_ARGS)
