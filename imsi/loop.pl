#!/usr/bin/perl -w

my $cmd = shift @ARGV;

if ( -f $cmd  ) {
    system("while [ 1 ]; do perl $cmd; sleep 1; done");
}
