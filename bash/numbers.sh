#!/usr/bin/env bash

declare -i a b

a=1
b=2
c=`expr $a + $b`
echo $c

d=$((a + b))
echo $d

let e=a+b
printf "e : %d\n" $e
