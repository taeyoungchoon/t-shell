#!/usr/bin/env python3

import subprocess as sp
import os, sys
import shutil

if len(sys.argv) == 2:
    target=sys.argv[1]
    try:
        shutil.rmtree(target)
        print(f'remove project {target}')
    except FileNotFoundError as e:
        print('file not exist', e)
