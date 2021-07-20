#!/usr/bin/env perl

foreach $line (<>) {
    if ($line =~ /yum.* -y$/ or $line =~ /yum.* -y /)  {
	$line =~ s/ -y//;
	$line =~ s/yum/yum -y/;
	print $line;
    } else {
	print $line;
   }
}
