#!/bin/env perl

#open(STDOUT, ">uname.out");
#open(STDOUT, ">", "variable.out");
#close(STDOUT);
#open(STDOUT, ">", \$variable);
system("uname");
#close(STDOUT);

#print \$variable; 
#print $variable;
__END__

$uname = `uname`;

if ($uname =~ /darwin/i) {
    print "mac";
}


