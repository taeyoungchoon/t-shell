import napalm

driver = napalm.get_network_driver('eos')
device = driver(hostname='192.168.26.111', username='admin', password='admin')
device.open()
device.load_merge_candidate(filename='tz.cfg')
print(device.compare_config())
#device.discard_config()
device.commit_config()
