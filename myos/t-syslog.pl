#!/usr/bin/perl

use strict;
use warnings;

my $os = $^O;
my %paths = ( 'darwin', '/var/log/system.log',
	      'linux', '/var/log/syslog.log',
	      'aix', '/var/adm/syslog.log',
	      'hpux', '/var/adm/syslog/syslog.log' );

system( "tail -5 $paths{$os}" );

__END__

use Switch;

my $uname = `uname -s`;

#if ( $uname =~ /darwin/ ) {
#    system("tail -5 /var/log/system.log");
#}

switch($uname) {
    case /darwin/i { system("tail -5 /var/log/system.log"); }
    case /linux/i { system("tail -5 /var/log/syslog.log"); }
    case /aix/i { system("tail -5 /var/adm/syslog.log"); }
    case /hp-ux/i { system("tail -5 /var/adm/syslog/syslog.log"); }
    case /windows/i { print "not yet"; }
}

__END__

tail -5 Win32::EventLog -> system
tail -5 /var/log/system.log
tail -5 /var/adm/syslog.log
tail -5 /var/adm/syslog/syslog.log
tail -5 alert.log

__END__

* read

swatch, logwatch, nagios, perl
Win32::EventLog
syslog.exe comes with cygwin
http://docstore.mik.ua/orelly/perl3/perlnut/ch22_04.htm

* green/yellow/red
* 80/90
* +tablespace
* location

** windows

eventvwr

* so

- dmesg or errpt
- even oracle
