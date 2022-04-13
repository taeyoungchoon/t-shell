import subprocess
import re


def check_returncode(process):
    if process.returncode == 0:
        return True
    else:
        return False


proc = subprocess.run(['ping', '-c', '3', '8.8.8.8'], capture_output=True)


if check_returncode(proc):
    status = proc.stdout.decode().splitlines().pop(-2)
    pattern = re.compile('(\d+.\d+)%')
    matched = pattern.search(status)
    matched.group(1)
