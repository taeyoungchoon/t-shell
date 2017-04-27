#!/usr/bin/perl

use warnings;
use strict;

my $usage = 0;

sub memory_usage_on_hpux {
    open (MEM, "swapinfo -amt |");
    
    foreach my $line (<MEM>) {
	if ( $line =~ /memory/ ) {
	    my @values = split /\s+/, $line;
	    my $usage = pop @values;
	    chop($usage);
	    $usage = int($usage);
	    return $usage;
	}
    }
    
    close MEM;
}

sub memory_usage_on_aix {
    open (MEM, "svmon -F |");
    
    foreach my $line (<MEM>) {
	if ( $line =~ /memory/ ) {
	    my @values = split /\s+/, $line;
	    my $usage = pop @values;
	    chop($usage);
	    $usage = int($usage);
	    return $usage;
	}
    }
    
    close MEM;
}

if ($^O =~ /hpux/) {
    $usage = &memory_usage_on_hpux();
} elsif ($^O =~ /aix/) {
    $usage = &memory_usage_on_aix();
} else {
    print "unknown";
    exit;
}

if ( $usage < 80 ) {
    print "$0: ok, $usage%\n";
} else {
    print "$0: not good, $usage%\n";
}



