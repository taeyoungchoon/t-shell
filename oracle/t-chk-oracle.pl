#!/usr/bin/perl -w

$numberoforacleinstance = `ps -ef | grep _pmon_ | grep -v grep | wc -l`;
chop($numberoforacleinstance);

if ( $numberoforacleinstance >= 1 ) {
        print "$numberoforacleinstance oracle instance exist\n";
        system("sh chk-oracle-tablespace.sh");
} else {
        print "no oracle instance exist\n";
}
