#!/usr/bin/env perl

print("stamp\tnow\tgap\n");
foreach $line (<>) {
    ($stamp, $data) = split(/\s+/, $line);
    
    $now = $data;
    $gap = $now - $post;

    printf("$stamp\t$now\t$gap\n");
    
    $post = $now;
}
