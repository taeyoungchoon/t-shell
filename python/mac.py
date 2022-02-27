#!/usr/bin/env python3

import re

with open('en1') as fh:
    lines = fh.readlines()

for line in lines:
    print(line.rstrip())
