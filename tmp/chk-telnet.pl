#!/usr/bin/perl

use strict;
use warnings;
use Expect;

my $exp = new Expect;
# $exp->log_stdout(0);
# $exp->log_file("/tmp/foo.log");

# $exp->raw_pty(0);
$exp->spawn("telnet");

if( $exp->expect(3,'-re',"telnet>") ) {
    $exp->send("status\n");
}

if( $exp->expect(3,'-re',"(No) connection") ) {
    if( ($exp->matchlist)[0] =~ /No/ ) {
	$exp->send("status\n");
    }
}
 
if( $exp->expect(3,'-re',"(te)lnet>") ) {
    $exp->send("quit\n");
}

# $exp->interact();

# print "-2.ok-\n" if ($exp->matchlist)[0] =~ /te/;

$exp->soft_close();
$exp->hard_close();

__END__

spawn telnet

expect {
    "telnet>" {
	send "status\r"
    }
}

expect "telnet>"
send "quit\r"
interact
