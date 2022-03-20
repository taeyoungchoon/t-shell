#!/usr/bin/env python

with open('d3') as f:
    data = f.readlines()

post = 0
for line in data:
    stamp, value = line.split()
    now = int(value.replace(',',''))
    gap = now - post
    print("{} {:,} {:,}".format(stamp, now, gap))
    post = now
