#!/usr/bin/perl -w

# snmp.pl x.x.x.x public
# snmpwalk -v 2c -c public x.x.x.x


my ($ip, $community);
my $out;

my $numberOfArg = $#ARGV + 1;

if ( $numberOfArg == 0 ) {
    exit;
}

$ip = $ARGV[0];
$community = $ARGV[1];

$out = sprintf("snmpwalk -v 2c -c %s %s", $community, $ip);
system($out);
