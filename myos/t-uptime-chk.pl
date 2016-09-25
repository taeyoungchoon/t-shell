#!/usr/bin/perl -w

foreach $l (`uptime`) {
    my @arr = split(/\s+/, $l);
    $length = $arr[2];
    if ( $length =~ /[0-9]:[0-9]/ ) {
	print "too less, caution\n";
    } elsif ( $length < 7 ) {
	print "less, caution\n";
    } elsif ( $length >= 7 ) {
	print "up enough\n";
    } else {
	print "debug\n";
    }
}

      

