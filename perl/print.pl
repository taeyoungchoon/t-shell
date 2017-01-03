my $num = 123;
my $string = 'attached';

sub return_string {
    return $string;
}

# print time() . "\n";
# print gmtime() . "\n";
my ($sec,$min,$hour,$mday,$mon,$year,$wday,$yday,$isdst) =  localtime(time);

foreach $i ($sec,$min,$hour,$mday,$mon,$year,$wday,$yday,$isdst) {
    print $i . "\n";
}

# my @abbr = qw/jan feb mar apr may jun jul aug sep oct nov dec/;
my @wday_values = qw/sun mon tue wed thu fri sat/;
# printf "\n%d %s %d", $year+1900, uc($abbr[$mon]), $mday;
# printf "\n%d [%d] %d", $year+1900, $mon, $mday;
printf "\n%d-%d-%02d %02d:%02d:%02d", $year+1900, $mon+1, $mday, $hour, $min, $sec;
printf "\n%s", $wday_values[$wday];

# sleep 1;
# print localtime() . "\n";
# print gettimeofday() . "\n";

__END__

print sprintf "hi, %05d %s\n", $num, $string;
print sprintf "hi, %05d %s\n", $num, &return_string;

