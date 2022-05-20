echo pre
sudo yum -y install epel-release
sudo yum -y install tree psmisc emacs-nox vim
python --version
sudo yum -y install python2-pip

echo install python3 
sudo yum -y install python3 
sudo yum -y install python3-pip

echo make env
pip3 install virtualenv
mkdir workspace
python3 -m virtualenv workspace
source workspace/bin/activate
pip3 install ansible

echo check
python --version
ansible --version

echo using jsonrpclib
cat <<EOF > j.py
from jsonrpclib import Server

switch = Server( 'http://cvpadmin:1234qwer@192.168.25.251/command-api' )
response = switch.runCmds( 1, ['show version'] )
print('The switch system MAC addess is', response[0]['systemMacAddress'])
EOF

echo using pyeapi
cat <<EOF > p.py
import pyeapi

conn = pyeapi.connect(host='192.168.25.251', transport='http')
conn.execute(['show verson'])
EOF

echo using pyeapi with conf
cat <<EOF > ~/.eapi.conf
[connection:arista1]
host: 192.168.25.251
transport: http
username: cvpadmin
password: 1234qwer
EOF

cat <<EOF > p2.py
import pyeapi

conn = pyeapi.connect_to('arista1')
print(conn.enable('show version'))
EOF

cat <<EOF > vlan.py
import pyeapi
from pprint import pprint

conn = pyeapi.connect_to('arista1')
vlan = conn.api('vlans')

vlan.create(123)
print("before : ", len(vlan.getall()))

for i in range(124, 130):
        vlan.create(i)
print("after create vlans : ", len(vlan.getall()))

for i in range(124, 130):
        vlan.delete(i)
print("delete temp vlans: ", len(vlan.getall()))
EOF
