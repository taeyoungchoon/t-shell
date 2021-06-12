#!/usr/bin/env python3

import subprocess
import re

interfaces=[]

output=subprocess.getoutput("ip -4 a | grep ^[0-9]")
for line in output.splitlines():
    interface=re.search("[0-9]*:(.*):", line)[1].strip()
    interfaces.append(interface)

for interface in interfaces:
    print(interface)
