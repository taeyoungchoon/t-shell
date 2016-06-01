#!/usr/bin/perl
use strict;
use warnings;
use feature qw(switch say);

my $used_space = `df -h / \|awk 'FNR == 2 {print \$5}'`;

given ($used_space) {
    chomp($used_space);
    when ($used_space lt '85%') { print "OK - $used_space of disk space used.\n"; exit(0);      }
    when ($used_space eq '85%') { print "WARNING - $used_space of disk space used.\n"; exit(1);      }
    when ($used_space gt '85%') { print "CRITICAL - $used_space of disk space used.\n"; exit(2); }
    default { print "UNKNOWN - $used_space of disk space used.\n"; exit(3); }
}

__END__

Nagios Exit Codes

0 OK
1 WARNING
2 CRITICAL
3 UNKNOWN
