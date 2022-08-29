import cvprac
import urllib3
urllib3.disable_warnings()
from pprint import pprint

from cvprac.cvp_client import CvpClient
client = CvpClient()
client.connect(['cv.t.com'], 'cvpadmin', '1234qwer')

parent = client.api.get_container_by_name("Tenant")
client.api.add_container("DC1", parent["name"], parent["key"])
parent = client.api.get_container_by_name("DC1")
client.api.add_container("leaf", parent["name"], parent["key"])
parent = client.api.get_container_by_name("DC1")
client.api.add_container("spine", parent["name"], parent["key"])
