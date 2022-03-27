#!/usr/bin/env python3

l, d, kv = [1,2,3], (1,2,3), {1:2,3:4}
s = 'hello'

print("%s, %d%d%d%d" % (s, l[0], d[1], 3, kv[3]))
print("{}, {}{}{}{}".format(s, l[0], d[1], 3, kv[3]))
print(f"{s}, {l[0]}{d[1]}3{kv[3]}")


