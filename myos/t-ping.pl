#!/usr/bin/perl -w

my $numberofargument = $#ARGV+1;
my $target = '8.8.8.8';
my $count = '3';

if ( $numberofargument == 1 ) {
    $target = shift;
} 

my $cmd = sprintf("ping -c $count $target");

# system($cmd);
# print $loss = `$cmd | grep loss | awk '{ print $7 }'`;
my $status = `$cmd | grep loss`;
my @less = split( /\s+/, $status );
if ( $less[6] =~ /0.0%/ ) {
    print "no packet loss to $target\n";
} else {
    print "packet loss happen to $target, dig some\n";
}
