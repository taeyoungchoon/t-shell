#!/usr/bin/perl

$cmd = sprintf("ifconfig | grep inet | grep -v inet6 | grep -v 127 | awk '{print $2}'");
system($cmd);
