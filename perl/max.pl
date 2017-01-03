use List::Util 'max';

print max(1,5,3), "\n"; # Also prints 5.

__END__

@lst = (3, 1, 2);

@lst = sort @lst;
print pop @lst;
__END__
print pop (reverse (sort @lst));

__END__

foreach $i (@lst) {
    print $i;
    print "\n";
}
