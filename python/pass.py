#!/usr/bin/env python

users = ['jack', 'statd']

with open('/etc/passwd') as fh:
    lines = fh.readlines()

print('')
for line in lines:
    k, *v = line.split(':')
    if k == 'root':
        print("user '%5s' has a shell %s" % (k, v[5].rstrip()))
    if k in users:
        print("user '%5s' has a shell %s" % (k, v[5].rstrip()))
