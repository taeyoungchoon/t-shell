#!/usr/bin/env python

users = ['jack', 'statd']

with open('/etc/fstab') as fh:
    lines = fh.readlines()

print('')
for line in lines:
    if not line.startswith('#'):
        k, *v = line.split()
        if v[1] == 'swap':
            print("%41s used for %s" % (k, v[1]))
        else:
            print("%41s used for %s" % (k, v[0]))
        
        
        
        


