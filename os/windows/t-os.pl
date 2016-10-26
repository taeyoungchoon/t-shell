use strict;
use warnings;

# my $os = $^O;

# if ($os =~ /darwin/) {
if ($^O eq 'darwin') {
    print "I am a mac." . "\n";
}
    
__END__

$ perl -de 0

Loading DB routines from perl5db.pl version 1.37
Editor support available.

Enter h or 'h h' for help, or 'man perldebug' for more help.

main::(-e:1):	0
  DB<1> use Config;

  DB<2> use English;

  DB<3> print "$OSNAME";
darwin
  DB<4> print $Config{osname};
darwin
  DB<5> print $^O;
darwin
  DB<6> quit

linux MSWin32
