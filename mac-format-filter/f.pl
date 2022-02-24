#!/usr/bin/env perl
#
# mac format filter
# from xx:xx:xx:xx:xx:xx to xxxx:xxxx:xxxx
#
# ver: 0.1
# date: 2022.2.23.
# written by t0spring
#

exit 1 if 

for (<>) {
    if(/((\w+):(\w+):(\w+):(\w+):(\w+):(\w+))/){
	$m1 = $1;
	$m2 = sprintf("%s%s.%s%s.%s%s", $2,$3,$4,$5,$6,$7);
	s/$m1/$m2/;
	print;
    } else {
	print;
    }
}
