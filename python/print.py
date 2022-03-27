#!/usr/bin/env python

import math, random

def init():
    global say, num
    say = ''.join(random.sample('asdf', 3))
    num = random.randint(1, 9)

init()
print('%03d %.2f %s' % (num, math.pi, say))

init()
print('{:03d} {:.2f} {}'.format(num, math.pi, say))

init()
print(f"{num:03} {math.pi:.2f} {say}")


