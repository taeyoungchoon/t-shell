import cvprac
import urllib3
urllib3.disable_warnings()
from pprint import pprint

from cvprac.cvp_client import CvpClient
client = CvpClient()
client.connect(['cv.t.com'], 'cvpadmin', '1234qwer')

result = client.get('/cvpInfo/getCvpInfo.do')
print("version: {}".format(result['version']))

inventory = client.api.get_inventory()
print("number of devices: {}".format( len(inventory) ))


