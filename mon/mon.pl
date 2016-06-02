#!/usr/bin/perl -w

use strict;

# print "ok\n";

my $cmd;
my $domain;
$domain = $ARGV[0];

if ($#ARGV >= 0) {
	$cmd = sprintf("ping -c 3 $domain");
	system($cmd);
	$cmd = sprintf("whois -Q $domain | grep \"\^   \"");
	system($cmd);
	$cmd = sprintf("host -t ns $domain");
	system($cmd);
	$cmd = sprintf("host -t mx $domain");
	system($cmd);
	$cmd = sprintf("nmap --script ssl-cert -p443 $domain");
	system($cmd);
}
