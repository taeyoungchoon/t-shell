#!/usr/bin/perl -w
use strict;
use POSIX;

my %cmds = ( "linux" => "df -Pk | grep -v ^tmpfs | grep -v ^udev",
	     "hp-ux" => "df -Pk",
	     "aix" => "df -Pk",
	     "cygwin" => "df -Pk",
	     "unknown" => "df -Pk",
	     "macosx" => "df -Pk -l" );
my $arch = "";

sub arching {
    my($kernelname) = shift;
    if ( $kernelname =~ m/linux/i ) {
	$arch = "linux";
    } elsif ( $kernelname =~ m/darwin/i ) {
	$arch = "macosx";
    } elsif ( $kernelname =~ m/cygwin/i ) {
	$arch = "cygwin";
    } else {
	$arch = "unknown";
    }
    return $arch;
}

$arch = &arching(readpipe("uname -s"));
my $cmd =  $cmds{ $arch };

sub pressing {
    my($in) = shift;
    chomp($in);
    my $len = length($in);
    my $out = "";

    if ( $len >= 7 ) {
	$out = sprintf("%d%s" , ceil($in/1024/1024) , "g");
    } elsif ( $len >= 4 ) {
	$out = sprintf("%d%s" , ceil($in/1024) , "m");
    } else {
	$out = sprintf("%d%s" , ceil($in) , "k");
    }
    return $out;
}

my @out = readpipe($cmd);

foreach my $line (@out) {
    if ( $line =~ /^F/ ) {
	printf("%-20s %8s %8s %8s %8s %-20s\n", "Filesystem", "Size", "Used", "Avail", "Capacity", "Mounted on");
    } else {
	my ($fs, $size, $used, $avail, $capacity, $mount) = split(/\s+/, $line);
	printf("%-20s %8s %8s %8s %8s %-20s\n", $fs, &pressing($size), &pressing($used), &pressing($avail), $capacity, $mount);
    }
}
