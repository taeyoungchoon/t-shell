#!/usr/bin/perl

use strict;
use warnings;

my $time = time();
my $boottime = `sysctl kern.boottime | cut -d " " -f 5 | cut -d "," -f 1`;

# print "__time__ : $time" . "\n";
# print "boottime : $boottime" . "\n";
my $since_boottime = ($time - $boottime);

my $minute = 60;
my $hour = $minute * 60;
my $day = $hour * 24;

my $status = "";

if( $since_boottime < $day * 1 ) { 
    $status = "error"; 
} elsif( $since_boottime < $day * 7 ) { 
    $status = "warn"; 
} elsif( $since_boottime >= $day * 7 ) {
    $status = "info";
} else {
    $status = "unknown";
}

print $status . "\n";

# print `uptime`;

__END__

use POSIX qw(strftime);
my $now_string = strftime "%a %b %e %H:%M:%S %Y", localtime;

print $now_string;

