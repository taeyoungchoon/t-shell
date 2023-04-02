#!/usr/bin/env python3

# ? grep ^uptime: makefile
# ? egrep "^\w+:" makefile

import re

f = open('makefile')
lines = f.readlines()

for line in lines:
    if re.match("up", line):
        print(line)

f.close()

