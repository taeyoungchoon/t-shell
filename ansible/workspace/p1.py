import pyeapi

conn = pyeapi.connect(host='192.168.25.251', transport='http', username='cvpadmin', password='1234qwer')
conn.execute(['show version'])
