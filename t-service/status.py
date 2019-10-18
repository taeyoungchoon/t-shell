#!/usr/bin/env python3

import subprocess

services = ['chronyd', 'atd']
brand = {'active': 'running',
         'inactive': 'dead',
         'unknown': 'not installed'}

for service in services:
    cmd = 'systemctl is-active ' + service
    status = subprocess.getoutput(cmd)
    print(service, status)
