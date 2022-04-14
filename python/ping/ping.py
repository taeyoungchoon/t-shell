import subprocess
import re

'''
run
filter
output
'''

def check_returncode(process):
    if process.returncode == 0:
        return True
    else:
        return False

def run():
    return subprocess.run(['ping', '-c', '3', '8.8.8.8'], capture_output=True)

def filtering():
    status = proc.stdout.decode().splitlines().pop(-2)
    pattern = re.compile('(\d+.\d+)%')
    matched = pattern.search(status)
    result = matched.group(1)
    result = float(output)
    return result

output = 0

if check_returncode(proc):
    output = filtering()
    if output == 0.0:
        print(True)
    else:
        print(False)

