{
    stamp = $1;
    gsub(/,/, "", $2);
    now = $2;
    gap = now - post;
    printf("%s %d %'d\n", stamp, now, gap);
    post = now;
}
