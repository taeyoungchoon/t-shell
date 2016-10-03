#!/usr/bin/perl

use strict;
use warnings;

sub os {
    my %tbl = ( 
	"darwin" => "macosx",
	"linux" => "linux",
	"hp-ux" => "hp-ux",
	"aix" => "aix",
	);
    
    my $uname;
    chomp($uname = `uname -s`);
    $uname = lc($uname);
    my $os = $tbl{$uname};
    return $os;
}

print "you are using " . &os() . ".\n";
