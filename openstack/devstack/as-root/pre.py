#!/usr/bin/env python3
import subprocess

def processing():
    (status, output) = subprocess.getstatusoutput(cmd)
    if status == 0:
        print(output)
    else:
        break
    
cmd = "sudo useradd -s /bin/bash -d /opt/stack -m stack"
processing()

cmd = "echo 'stack ALL=(ALL) NOPASSWD: ALL' | sudo tee /etc/sudoers.d/stack"
processing()

cmd = "sudo su - stack"
processing()

