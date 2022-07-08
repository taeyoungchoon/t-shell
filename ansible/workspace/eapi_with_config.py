import pyeapi

conn = pyeapi.connect_to('arista1')
print(conn.enable('show version'))
