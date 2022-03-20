{
    stamp = $1;
    now = $2;
    gap = now - post;
    printf("%d %d %d\n", stamp, now, gap);
    post = now;
}
