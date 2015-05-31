#!/bin/env perl

print $ip = `/sbin/ifconfig`;

__END__

my $platform;

if ($uname =~ /darwin/i) { 
    $platform = "mac"; 
}
if ($uname =~ /linux/i) { 
    $platform = "linux"; 
}

print sprintf("%s\n", $platform);


