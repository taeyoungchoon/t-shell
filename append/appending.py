#!/usr/bin/env python3

data="""append line 1
append line2"""

with open("before") as f:
    for line in f:
        if line.find("body") == 0:
            print(line.rstrip())
            print(data)
        else:
            print(line.rstrip())
