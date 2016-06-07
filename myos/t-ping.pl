#!/usr/bin/perl

my $numberofargument = $#ARGV+1;
my $target = '8.8.8.8';
my $count = '3';

if ( $numberofargument == 1 ) {
    $target = shift;
} 

my $cmd = sprintf("ping -c $count $target");

system($cmd);
