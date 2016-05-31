#!/usr/bin/perl -w

if ($#ARGV == -1)
{
    print "too less say with pure, clean, or analysis\n";
    exit;
}

my @options = @ARGV;
my $menu = $options[0];

my %cmds = ( "linux" => "df -Pk | grep -v ^tmpfs | grep -v ^udev",
	     "hp-ux" => "df -Pk",
	     "aix" => "df -Pk",
	     "macosx" => "df -Pk -l" );

my $kernelname = readpipe("uname -s");

if ( $kernelname =~ m/linux/i ) {
    $arch = "linux";
}

my $cmd =  $cmds{ $arch };

my @df = readpipe($cmd);

my $numberofline = $#df;
print "number of line " , $numberofline + 1 , "\n\n";

foreach $line (@df) {
    print $line;
}
