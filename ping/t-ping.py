#!/usr/bin/env python3

import sys
import subprocess

cmd = 'ping'
option = ''
target = '8.8.8.8'

if len(sys.argv) == 2:
    target = sys.argv[1]

if sys.platform == 'cygwin' or sys.platform == 'win32':
    option = '-n 1'
    req = '{} {} {}'.format(cmd, option, target)
else:
    option = '-c 1'
    req = '{} {} {}'.format(cmd, option, target)
    
(rc, out) = subprocess.getstatusoutput(req)
if rc == 0:
    print("\n** {}".format(req))
    print(out)
else:
    print("\n** {}".format(req))
    print('fail to run req')
