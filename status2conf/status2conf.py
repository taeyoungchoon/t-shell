#!/usr/bin/env python3

# status to conf
#
# 1. copy port, name, status, vlan field values to notepad from excel
# 2. save data as input.tsv
# 3. run this script
#

import csv

with open("input.tsv") as data:
        for tokens in csv.reader(data, dialect="excel-tab"):
                interface_value, description_value, status_value, vlan_value = tokens
                if status_value == 'up':
                        print(f'!')
                        print(f'interface {interface_value}')
                        print(f'description "{description_value}"')
                        print(f'switch access vlan {vlan_value}')

print(f'!')
