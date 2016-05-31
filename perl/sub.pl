#!/usr/bin/perl -w

&msg("hi");
&msg("man");

sub msg {
    my $arg = "";
    $arg = shift;
    print "inside msg : $arg\n";
}


