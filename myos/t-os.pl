#!/usr/bin/perl -w

my $uname = `uname -s`;

if ( $uname =~ /darwin/i )	{ print "macosx" . "\n"; }
if ( $uname =~ /linux/i )	{ print "linux"  . "\n"; }
if ( $uname =~ /hp-ux/i )	{ print "hp-ux"  . "\n"; }
if ( $uname =~ /aix/i )		{ print "aix"    . "\n"; }
