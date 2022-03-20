NR==1 {
     post = $1;
     print(post)
}
NR >1 {
     now = $1;
     gap = now - post;
     post = now;
     printf("%d %d\n", now, gap)
}
