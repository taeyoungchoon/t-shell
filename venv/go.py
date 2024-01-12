#!/usr/bin/env python3

import subprocess as sp
import os, sys

if len(sys.argv) == 2:
    target=sys.argv[1]
    try:
        os.mkdir(target)
        cmd=f'python3 -m venv {target}/.venv --prompt {target}'
        (status, output)=sp.getstatusoutput(cmd)
        print(f'virtual env made for project {target}')
    except FileExistsError as e:
        print('file exist', e)
