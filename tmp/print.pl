#!/usr/bin/perl --

#use strict;
#use Socket;

my ($CRLF) = "\r\n";

unless ($#ARGV > 0) {
    &usage;
}

sub usage {
    print <<ENDOFUSAGE;

	print.pl [-h]
	
ENDOFUSAGE

	exit(0);
}

&parseCmdLine;

sub parseCmdLine {
    foreach $i (0...$#ARGV) {
	if( $ARGV[$i] =~ /^\-(\w)$/ ) {
	  SWITCH: {
	      /h/ and &usage, last SWITCH;
	    }
	}
    }
}

print "this is fine\n";
