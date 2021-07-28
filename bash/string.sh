#!/usr/bin/env bash
# filename : string.sh

foo='this is it'
echo ${foo:-or not}
echo ${bar:-not defined then this is the value of it}
# echo ${spam:?not defined then say some then exit}
echo ${foo/this}
echo ${foo/this/that}
echo ${foo/is/are}
echo ${foo//is/are}
echo ${foo^}
echo ${foo^^}

echo ${foo:0:4}

v_path='/usr/local/bin/bash.exe'
echo ${v_path#*/}
echo ${v_path##*/}
echo ${v_path%/*}
echo ${v_path%%/*}

basename ${v_path}
dirname ${v_path}




