"""v3, input v3 then 3 + 220 = 223 (v15, 15 + 220 = 235)
192.168.26.223

3 + 20 = 23 (15 + 20 = 35)
50:ac:84 + 26:02 + 23 (50:ac:84 + 26:02 + 35)

192.168.25.211 ns
192.168.25.204 ntp
192.168.26.1 gw

--

admin / admin
cvpadmin / 1234qwer , priv 15, role network-admin
hostname 
ip
mac
adm_username, adm_password
usr1_username, usr1_password, usr1_priv, usr1_role
ns1
ntp1
gw"""

import sys

hostname=""
hostname="bar"

def processing():
  hostname = sys.argv[1]
  print(hostname)

if len(sys.argv) == 2:
  processing()

print(hostname)
