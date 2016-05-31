#!/usr/bin/perl -w

my %h = ( 1 => 2,
	  3 => 4 );

my ($k, $v);

while ( ($k, $v) = each %h ) {
    printf("key $k and value $v \n");
}

