# use Expect;

foreach my $file (`ls`) {
  print $file;
  my @stat = stat($file);
  print @stat[7];
  # sprintf("size of $file, @stat[7]");
}

__END__

my $name = "cwd.pl";

open(FN, $name);
while(<FN>){
  print;
}
close(FN);

my @stat = stat($name);
print "@stat[7]";

