use Win32::Process::List;

my @procs = `tasklist`;

my $P = Win32::Process::List->new();  
my %list = $P->GetProcesses();    

@keys_list = keys %list;

print "@keys_list";

__END__

foreach my $key ( sort keys %list ) {
    # $list{$key} is now the process name and $key is the PID
    # print sprintf("%30s has PID %15s", $list{$key}, $key) . "\n";
    printf("%5s %s\n", $key, $list{$key});
}

__END__

# print "@procs";
foreach $proc ( @procs ) {
    if ( $proc =~ /svchost/ ) {
	print $proc;
    }
}

