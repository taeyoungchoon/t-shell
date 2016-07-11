#!/usr/bin/perl

use strict;

my @list = qw/i love you/;
my $foo;

print $foo = \@list;

print "\n";

print @$foo;

__END__

print @list;
print "\n";
print "@list";
print "\n";

foreach my $item (@list) {
    print $item;
}
