#!/usr/bin/perl

use warnings;
use strict;

open (CPU, "sar 3 3 |");

foreach my $line (<CPU>) {
    if ( $line =~ /Average/ ) {
	my @values = split /\s+/, $line;
	my $idle = int(pop @values);
	my $usage = 100.0 - $idle;

	if ( $usage < 80 ) {
	    print "$0: ok, $usage%\n";
	} else {
	    print "$0: not good, $usage%\n";
	}
    }
}


close CPU;
