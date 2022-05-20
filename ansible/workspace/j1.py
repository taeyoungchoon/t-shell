from jsonrpclib import Server

switch = Server( 'http://cvpadmin:1234qwer@192.168.25.251/command-api' )
response = switch.runCmds( 1, ['show version'] )
print('The switch system MAC addess is', response[0]['systemMacAddress'])
