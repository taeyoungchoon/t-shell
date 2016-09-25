#!/usr/bin/perl -w

my $numberofargument = $#ARGV+1;
my $target = 'kr.pool.ntp.org';

if ( $numberofargument == 1 ) {
    $target = shift;
} 

my $cmd = sprintf("ntpdate -q $target");

my $status = `$cmd | tail -1`;
my @gap = split( /\s+/, $status );

if ( abs($gap[9]) < 1 ) {
    print "time sync status is good\n";
} else {
    print "check time sync status\n";
}
