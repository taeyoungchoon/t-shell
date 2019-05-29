#!/usr/bin/perl

use strict;
use warnings;
use feature qw/ say /;
use Getopt::Std;
use File::Temp qw/ tempfile /;

my $date_version = "20190523_1";
my $pure_version = "v0.01";

my %options;
getopts('hvc:s:', \%options);

# for my $key (keys %options) {
#     print "$key : $options{$key}\n";
# }
    
if ( defined $options{h} ) {
    print<<ENDOFUSAGE;
    
    $0 x -h
    $0 x -c "command1;command2"
    $0 x -s script.sh

ENDOFUSAGE
    exit(0);
}

if ( defined $options{v} ) {
    say "date version : " . $date_version;
    say "pure version : " . $pure_version;
    exit(0);
}

if ( defined $options{c} ) {
    my ($fh, $filename) = tempfile();
    print $fh "hostname\n";
    print $fh $options{c};
    say "cons -q -T x < $filename";
    exit;
}

if ( defined $options{s} ) {
    say "cons -q -T x < $options{s}";
    exit;
}

