#!/usr/bin/perl

use strict;
use warnings;

my $uptime = `uptime`;
# $uptime = "9:44  up 12 mins, 2 users, load averages: 1.75 5.17 5.71";
# $uptime = "18:17:07 up 86 days,  3:57,  6 users,  load average: 0.16, 0.07, 0.06";
# $uptime = "18:36  up  7:28, 2 users, load averages: 1.47 1.85 1.97";
$uptime =~ /up\s{1,2}([0-9:((days|mins)\s]+),/;
my $waste = $1;
# print $waste;

my $waste_d = 0;

if ($waste =~ /:/) {
    $waste_d = 0;
} elsif ($waste =~ /([0-9]+)\sdays/) {
    $waste_d = $1;
}
# print $waste_d;

my $warn = 7;
my $error = 0;
my $str;

if( $waste_d == $error ) {
    $str = "error, less than a day";
} elsif ( $waste_d <= $warn ) {
    $str = "warn, less than a week";
} elsif ( $waste_d > $warn ) {
    $str = "info, more than a week";
} else {
    $str = "unknown";
}

print $waste . " - " . $str . "\n";;

__END__

uptime on unix-like
18:17:07 up 68 days,  3:57,  6 users,  load average: 0.16, 0.07, 0.06
18:36  up  7:28, 2 users, load averages: 1.47 1.85 1.97

/up\s{1,2}[0-9:]{1,5},/

sysinfo on windows
