import subprocess as sp

proc = sp.Popen(['uname','-a'], stdout=sp.PIPE, stderr=sp.PIPE)
out, err = proc.communicate()
hn, ver = out.split()[1:3]
print('\nhostname: %s\nversion: %s' % (hn.decode(), ver.decode()))


