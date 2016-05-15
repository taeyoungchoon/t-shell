open($fh,'ntpdate -q time.bora.net|');

while( <$fh> ) {
    print;
}

close($fh);
