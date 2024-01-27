#!/usr/bin/env python3

import os
import sys
import venv
import argparse

parser = argparse.ArgumentParser()
parser.add_argument('--project', '-p', help='name of the project')
args = parser.parse_args()

def make_env():
    project = args.project
    target_directory='{}/.venv'.format(project)

    if project == None:
        print('Name of the project required')
        sys.exit(1)
    
    try:
        os.listdir(project)
    except FileNotFoundError as e:
        os.mkdir(project)
        venv.create(target_directory, prompt=project)
    else:
        print('{} directory exist'.format(project))
        sys.exit(2)

if __name__ == "__main__":
    make_env()
