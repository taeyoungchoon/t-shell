#!/usr/bin/env python3

with open('c') as f:
    d = f.readlines()

post = 0
for i in d:
    now = int(i)
    gap = now - post
    print(now, gap)
    post = now
