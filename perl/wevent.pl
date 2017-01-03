#!/usr/bin/perl

# use warnings;
# use strict;
use Win32::EventLog;

my $handle = Win32::EventLog->new("System")
  or die "can't open log\n";

$handle->GetNumber(my $recs);
print $recs;

$handle->GetOldest($base)
  or die "Can't get number of oldest EventLog record\n";

$handle->Close;

__END__

while ($x < $recs) {
  $handle->Read(EVENTLOG_FORWARDS_READ|EVENTLOG_SEEK_READ,
		$base+$x,
		$hashRef)
    or die "Can't read EventLog entry #$x\n";
  if ($hashRef->{Source} eq "EventLog") {
    Win32::EventLog::GetMessageText($hashRef);
    print "Entry $x: $hashRef->{Message}\n";
  }
  $x++;
}


