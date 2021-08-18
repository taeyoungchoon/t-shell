#!/usr/bin/env python3

from jsonrpclib import Server
import json

def t_print(input):
    print( json.dumps(input, sort_keys=True, indent=4) )

sw = Server( 'http://Script:Arista@172.20.99.101/command-api' )

resp = sw.runCmds( 1, ['show version'] )
# print(json.dumps(resp, sort_keys=True, indent=4))
print("The sw's system MAC addess is", resp[0]['systemMacAddress'])

resp = sw.runCmds( 1, ['show uptime'] )
# print(json.dumps(resp, sort_keys=True, indent=4))
t_print(resp)
print("uptime is", int( resp[0]['upTime'] / 60 ), 'm')
print("near load average is", resp[0]['loadAvg'][1])



