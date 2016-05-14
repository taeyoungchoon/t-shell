#!/usr/bin/perl

$pattern = $ARGV[0];

system("find . -type f -print | xargs grep $pattern");

__END__

system("grep -r $pattern *") if $^O =~ /linux/;
system("find . -type f -print | xargs grep $pattern") if $^O =~ /hpux/;

__END__

if (`uname -a | grep -i linux`) {
    `grep -r $1;`
} else {
    `grep -r $1;`
}
