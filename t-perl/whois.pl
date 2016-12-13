use strict;
use warnings;
use Net::Whois::Raw;

die "Usage: perl whois.pl <IP Address>" unless $ARGV[0];
foreach ( split( /\n/ , whois(shift) ) ) {
  print $_, "\n" if ( m/^(netrange|orgname)/i );
}
	  
