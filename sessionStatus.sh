#!/bin/csh
set session=`fw tab -t connections -s | grep localhost | awk '{ print $4 }'`
echo $session using
