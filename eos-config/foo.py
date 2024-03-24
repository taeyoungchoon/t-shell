"""3, input v3 then 3 + 220 = 223 (v15, 15 + 220 = 235)
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

ns  = "192.168.25.211"
ntp = "192.168.25.204"
gw  = "192.168.26.1"
ip  = ""
mac = ""
id  = "admin"
pw  = "admin"
cid = "cvpadmin"
cpw = "1234qwer"
hn  = ""

def printing():
  print(hn)

def processing():
  salt = sys.argv[1]
  ip_tail = 220 + int(salt)
  ip = f"192.168.26.{ip_tail}"
  mac_tail = 20 + int(salt)
  mac = f"50:ac:84:26:02:{mac_tail}"
  hn = f"v{salt}"
  
  print(f"hostname {hn}")
  print(f:

if len(sys.argv) == 2:
  processing()
  # printing()
