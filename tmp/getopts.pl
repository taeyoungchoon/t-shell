#!/usr/bin/perl

use Getopt::Std;

getopts('h');

if ( $opt_h ) {
    print<<ENDOFUSAGE;
    
    $0 - this is the snippet
	
ENDOFUSAGE
    exit(0);
}
