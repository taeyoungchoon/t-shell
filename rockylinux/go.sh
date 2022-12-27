#!/usr/bin/env bash

if [[ $# == 0 ]]; then
    printf "what you can say:\n"
    cat go.sh | awk '/^function/ { print $2 }' | sed -e 's/f_//' -e 's/^/- /'
fi

function f_clean {
	vagrant destroy -f
}

function f_up {
	vagrant up
}

function f_ssh {
	vagrant ssh
}

if   [[ "$1" =~ clean ]]; then
    f_clean
elif [[ "$1" =~ ssh ]]; then
    f_ssh
elif [[ "$1" =~ up ]]; then
    f_up
fi
