#!/usr/bin/perl

use warnings;
use strict;

my $exclude = "cimserver|xntpd|sshd|ftpd|nfsd|inetd|su|repeats|VERITAS|ftp|sendmail|lvmpud";
my $count = 0;
my $max = 5;

my $month="";
$month = `LANG=C date +%b`;
chomp($month);

my $buf="";

my $path="";

if ($^O =~ /hpux/) {
    $path = "/var/adm/syslog/syslog.log";
} elsif ($^O =~ /aix/) {
    $path = "/var/adm/syslog.log";
} elsif ($^O =~ /linux/) {
    $path = "/var/log/messages";
} else {
    print "unknown operating system";
    exit;
}

open (LOG, "cat $path | tail -1000 |");
open (BUF, '>', "/tmp/$0.tmp");

foreach my $line (<LOG>) {
    if ($line !~ /$exclude/) {
	print BUF $line;
    }
}

close BUF;
close LOG;

open (BUF, "cat /tmp/$0.tmp | tail -5 | grep ^$month |");

foreach my $line (<BUF>) {
    if ($line) {
	$count++;
	print "$0: not good,\n" if $count eq 1;
	print $line;
    }
}

print "$0: ok,\n" if $count eq 0;

close BUF;
