import subprocess 

proc = subprocess.Popen(['uname','-a'])
#proc = sp.Popen(['uname','-a'], stdout=sp.PIPE, stderr=sp.PIPE)
#out, err = proc.communicate()
