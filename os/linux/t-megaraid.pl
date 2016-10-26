#!/usr/bin/perl

use strict;
use warnings;

my $number_of_arg = @ARGV;

if ($number_of_arg == 0) {
    &help();
    exit;
}

my $lib = "http://ftp.cs.stanford.edu/pub/rpms/centos/5/x86_64/Lib_Utils-1.00-08.noarch.rpm";
my $cli = "http://ftp.cs.stanford.edu/pub/rpms/centos/5/x86_64/MegaCli-8.00.46-1.i386.rpm";

my $command = shift(@ARGV);

if ($command eq "download" ) {
    &download_rpm();
} elsif ($command eq "status") {
    &status();
} elsif ($command eq "disk") {
    &disk();
} else {
    &help();
}

sub help {
    print "download : install megacli rpm for centos 5" . "\n";
    print "status : rebulid status, simply" . "\n";
    print "disk : physical disk information" . "\n";
}

sub download_rpm {
    if( -f "/opt/MegaRAID/MegaCli/MegaCli64") {
	print "you have it" . "\n";
	exit;
    }
    system("rpm -Uvh $lib");
    system("rpm -Uvh $cli");
}

my $megacli = "";

sub set_megacli {
    # if (`uname -a` =~ m/x86_64/) {
    $megacli = "/opt/MegaRAID/MegaCli/MegaCli64";
    #} else {  
    #$megacli = "/opt/MegaRAID/MegaCli/MegaCli";
    #}
}

sub status {
    &set_megacli();
    my @output = readpipe("$megacli -LDinfo -L0 -a0");
    foreach my $line (@output) {
	print $line if $line =~ /^State/;
    }
}

sub disk {
    &set_megacli();
    my @output = readpipe("$megacli -PDList -aALL");
    foreach my $line (@output) {
	print $line if $line =~ /Slot|FRU|Raw Size/;
    }
}

