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
