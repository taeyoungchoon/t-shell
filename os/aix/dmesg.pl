#!/usr/bin/perl -w
use Term::ANSIColor;

my ($identifier);

my $hstamp = `date +%m%d`;
$hstamp =~ s/\r//g;
$hstamp =~ s/\n//g;

foreach $line (`errpt`) {
    if ($line !~ /^IDENTIFIER/) {
        #print $line;

        @tokens = split(/\s+/,$line);
        $timestamp = $tokens[1];

	if ($timestamp =~ m/$hstamp/) {
            print color("red"), $line, color("reset");
        } else {
            print color("green"), "nothing special" , color("reset");
	}
    }

}

__END__

IDENTIFIER TIMESTAMP  T C RESOURCE_NAME  DESCRIPTION
C8375BE4   0522215816 I O hdisk4         CACHED DATA WILL BE LOST IF CONTROLLER F
C8375BE4   0522215816 I O hdisk3         CACHED DATA WILL BE LOST IF CONTROLLER F
C8375BE4   0522215816 I O hdisk2         CACHED DATA WILL BE LOST IF CONTROLLER F
C8375BE4   0521215816 I O hdisk4         CACHED DATA WILL BE LOST IF CONTROLLER F
