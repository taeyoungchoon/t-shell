import subprocess
import re
import sys

CMD = 'ping'
OPTION = ''
VARIABLE = '3'
TARGET = '8.8.8.8'

def command_line():
    if sys.platform == 'win32':
        OPTION = '-n'
    else:
        OPTION = '-c'

    return CMD, OPTION, VARIABLE, TARGET

def filter_loss(line):
    pattern = re.compile('((\d+.\d+)|(\d+))%')
    matched = pattern.search(line)
    output = matched.group(1)
    return float(output)

def pinging_loss():
    try:
        cmd = command_line()
        proc = subprocess.run(cmd, capture_output=True, check=True)
    except subprocess.CalledProcessError as e:
        print(e)
        return

    if sys.platform == 'win32':
        REQUIRED = -3
    else:
        REQUIRED = -2

    status_line = proc.stdout.decode().splitlines().pop(REQUIRED)
    return filter_loss(status_line)

def main():
    if pinging_loss() == 0:
        print(True)

if __name__ == '__main__':
    main()
