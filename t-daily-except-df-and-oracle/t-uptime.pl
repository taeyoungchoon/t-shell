#!/usr/bin/perl

use warnings;
use strict;

open (UP, "uptime|");

foreach my $line (<UP>) {
    if ( $line =~ /up\s(\d+)\sdays/ ) {
	my $days = $1;
	if ( $days > 7 ) {
	    printf "$0: ok, %d days\n", $days;
	} else {
	    printf "$0: not good, %d days\n", $days;
	}
    }
}

close UP;

__END__

* HP-UX

# uname -a
HP-UX ignite B.11.31 U ia64 3694116724 unlimited-user license

# uptime
  9:16am  up 283 days, 11:38,  2 users,  load average: 0.00, 0.00, 0.00

* Linux

$ uname -a
Linux edu 2.6.18-308.4.1.el5 #1 SMP Tue Apr 17 17:08:00 EDT 2012 x86_64 x86_64 x86_64 GNU/Linux

$ uptime
 09:26:33 up 283 days,  9:29,  2 users,  load average: 0.24, 0.18, 0.11
