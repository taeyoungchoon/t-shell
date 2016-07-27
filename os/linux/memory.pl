#!/usr/bin/perl -w
use Term::ANSIColor;

my $line;
my ($total, $free, $shared, @items);
$total = $free = $shared = 0;
my $leftp;

system("free -m");

foreach $line (`free -m`) {
    if ($line =~ /^Mem/) {
	@items = split(/\s+/,$line);
	$total = $items[1];
	$free = $items[3];
    }
    if ($line =~ /^-/) {
	@items = split(/\s+/,$line);
	$shared = $items[3];
    }
}

printf("\ntotal : %d, free : %d, shared : %d \n", $total, $free, $shared);
$leftp = int(($free + $shared) * 100 / $total);

if ($leftp < 20) {
    $out = sprintf("memory : %d%s Left\n", $leftp, "%");
    print color("yellow"), $out, color("reset");
} else {
    $out = sprintf("memory : %d%s Left\n", $leftp, "%");
    print $out;
}

__END__

# free -m
             total       used       free     shared    buffers     cached
Mem:           500        481         19          3         42        341
-/+ buffers/cache:         97        402
Swap:          167          1        166


