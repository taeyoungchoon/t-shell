import subprocess
import re
import sys

CMD = 'ping'
OPTION = ''
VARIABLE = '3'
TARGET = '8.8.8.8'
REQUIRED = 0


def command_line():
    if sys.platform == 'win32':
        OPTION = '-n'
    else:
        OPTION = '-c'

    return CMD, OPTION, VARIABLE, TARGET


def pinging():
    try:
        cmd = command_line()
        print(cmd)
        proc = subprocess.run(cmd, capture_output=True, check=True)
    except subprocess.CalledProcessError as e:
        print(e)
        return

    print(REQUIRED)

    if sys.platform == 'win32':
        REQUIRED = -3
    else:
        REQUIRED = -2

    print(REQUIRED)

    REQUIRED = -3
    status_line = proc.stdout.decode().splitlines().pop(REQUIRED)
    print(proc.stdout.decode())

    pattern = re.compile('((\d+.\d+)|(\d+))%')
    matched = pattern.search(status_line)
    output = matched.group(1)
    return float(output)

def main():
    if pinging() == 0:
        print(True)

if __name__ == '__main__':
    main()
