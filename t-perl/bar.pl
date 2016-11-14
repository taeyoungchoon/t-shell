print pack("C4",65,66,67,68);
print "\n";

__END__

print pack('a8',"hello");
print "\n";

print pack('A8',"hello");
print "\n";

print "[";
print unpack('a8',"hello\0\0\0");
print "]";
print "\n";

__END__

# extract column with unpack
$a = "To be or not to be";
$b = unpack("x13 A4", $a);  # skip 6, grab 6
print $b . "\n";

