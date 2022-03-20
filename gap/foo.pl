#!/usr/bin/env perl

$post = 0;
foreach $line (`cat c`) {
    $line =~ s/\r//;
    $line =~ s/\n//;
    
    $now = $line;
    $gap = $now - $post;
    printf("$now\t$gap \n");
    
    $post = $now;
}
