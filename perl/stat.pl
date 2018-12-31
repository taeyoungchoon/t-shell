#!/usr/bin/env perl

use strict;
use warnings;

foreach my $filename (`ls`) {
    open(FH, $filename);
    my @fileinfo = stat(FH);
    chop($filename);
    printf("$filename size: $fileinfo[7] bytes.\n");
    close(FH);
}

__END__
# use Expect;
my $name = "cwd.pl";

open(FN, $name);
while(<FN>){
  print;
}
close(FN);

my @stat = stat($name);
print "@stat[7]";

__END__
foreach my $file (`ls`) {
  # print $file;
($dev,$ino,$mode,$nlink,$uid,$gid,$rdev,$size,
                      $atime,$mtime,$ctime,$blksize,$blocks)
                          = stat($file);
print $dev;
  print stat $file;
  print stat($file);
  # my @stat = stat($file);
  # print "@stat";
  # print @stat[7];
  # sprintf("size of $file, @stat[7]");
}



