#!/usr/bin/env python3
import re
import json

lines = []
google_group = []
naver_group = []
google_pattern = re.compile("^1.1.1|^2.2.2")
naver_pattern = re.compile("^1.1.2")

def group_service(line):
    info = re.split("\s", line)
    ip = info[0]; hn = info[1]

    if re.search(naver_pattern, ip):
        naver_group.append(ip)
    elif re.search(google_pattern, ip):
        google_group.append(ip)
    else:
        print("it doesn't belong any group:")
        print(line)

def process_hosts():
    input = open('hosts','r')
    lines = input.readlines()
    for line in lines:
        group_service(line)
    input.close()

def verify_groups():
    data = {'google': google_group, 'naver': naver_group}
    print(json.dumps(data, indent=4))

process_hosts()
verify_groups()
