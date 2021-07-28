#!/usr/bin/env bash
# filename : string.sh

foo='this is it'
echo $foo
echo ${foo}
echo ${foo:-or not}
echo ${bar:-or not}
echo ${foo:?say so}
