#!/usr/bin/env python3

import math

print("hello, world")

name="jack"
num = math.pi
output1 = "hello%0.2f, %10s" % (num, name)
output2 = "hello{0:0.2f}, {1:>10}".format(num, name)
output3 = f"hello{num:0.2f}, {name:>10}"
print(output1)

try:
    print("this is the try, not an syntax error")
    y = 10 / 0
except Exception as e:
    print("this is the except:", e)
    # print(e)
else:
    print("this is the else")
finally:
    print("this is the finally")

class Switch:
    name=

sw1 = Switch()
print(sw1)
