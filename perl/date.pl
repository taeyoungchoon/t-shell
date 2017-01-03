#!/usr/bin/perl

use warnings;
use strict;

my $date = `date`;
my @tk = split / /, $date;

# print "@tk";
print "Today is " . $tk[0] . "day\n";
print "And then " . $tk[3];
