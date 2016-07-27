#!/usr/bin/perl -w
use Term::ANSIColor;

my $line;
my ($filesystem, $total, $used, $available, $capacity, $mount);
my $left;
my $condition;

my $stamp = `date +%Y%m%d.%H%M%S`;
$stamp =~ s/\r//g;
$stamp =~ s/\n//g;

foreach $line (`df -Pk`) {
    print $line;
}

foreach $line (`df -Pk`) {
    if ($line !~ /^Filesystem/) {
	# print $line;

	($filesystem, $total, $used, $available, $capacity, $mount) = split(/\s+/,$line);
	$left = int($available / $total * 100);

	if (length($available) > 6) {
	    $available = int($available/1024/1024);
	    $available = $available . "g";
	} else {
	    $available = int($available/1024);
	    $available = $available . "m";
	}
	
	if ($left < 20) {
	    $condition = "warn";
	    $out = sprintf("\n%s %s %d%s (%s) left\n",$stamp, $mount, $left, "%", $available);
	    print color("yellow"), $out, color("reset");
	}
    }
    
}
