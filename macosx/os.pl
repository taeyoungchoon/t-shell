#!/usr/bin/perl -w

my $uname;
$uname = `uname -s`;

if ( $uname =~ /darwin/i ) { print "macosx" . "\n"; }
