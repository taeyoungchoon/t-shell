#!/usr/bin/perl

foreach $line (<>) {
    $line =~ s/\r//g;
    $line =~ s/\n//g;
    print $line . "\n";
}
