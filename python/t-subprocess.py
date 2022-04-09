import subprocess
import subprocess as sp


def fact():
    '''gather fact'''
    proc = subprocess.Popen(['uname', '-a'], stdout=sp.PIPE, stderr=sp.PIPE)
    (out, err) = proc.communicate()
    hn, ver = out.split()[1:3]
    print('\nhostname: %s\nversion: %s' % (hn.decode(), ver.decode()))

    
def df():
    '''df helper'''
    proc = subprocess.run(['df', '-Pk', '-l'], capture_output=True)

    diskusage = proc.stdout.decode().splitlines()
    diskusage.pop(0)

    for line in diskusage:
        filesystem, blocks, used, avaiable, capacity, mounted = line.split()
        capacity = capacity.replace('%', '')
        capacity = int(capacity)
        if capacity > 70:
            print('Warning: {}% used on {}'.format(capacity, mounted))


fact()
df()
