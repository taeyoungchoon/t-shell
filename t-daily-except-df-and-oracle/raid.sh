echo "= os disk =="
sasmgr get_info -N  -D /dev/sasd1 -q raid | egrep "Raid Level|Raid State"
echo ""
echo "= data disk =="
sautil /dev/ciss0 | egrep "Logical Drive Status|Fault"
