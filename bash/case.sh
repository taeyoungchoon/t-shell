#!/usr/bin/env bash
#
# from emacs, C-c C-c

case $1 in
    yes|y)
	echo yep
	;;
    no|n)
	echo no, no
	;;
    *)
	echo need on argument
	;;
esac


