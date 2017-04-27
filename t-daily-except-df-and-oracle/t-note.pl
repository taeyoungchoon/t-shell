#!/usr/bin/perl

use warnings;
use strict;

my $note = "/.daily.note";

if ( -e $note) {
    print "note\n";
    print "---\n";
    open (NOTE, "cat $note |");
    while ( <NOTE> ) {
	print;
    }
    close NOTE;
}
