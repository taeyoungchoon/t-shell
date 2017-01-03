use Net::Ping;
use POSIX qw(strftime);

$host = shift;
$timeout = 1;

while ( 1 ) {
    &ping();
    sleep 1;
}

sub ping {
    $p = Net::Ping->new();
    
    if ( $p->ping($host, $timeout) ) {
	# print strftime "%Y%m%d.%H%M%S", localtime;
	# print " $host is alive.\n";
    } else {
	print strftime "%Y%m%d.%H%M%S", localtime;
	print " $host is dead.\n"
    }
    
    $p->close();
}

__END__

 strftime "%Y%m%d.%H%M%S", localtime;
