#echo "port 80:"
#curl 192.168.33.100:80

echo
echo "server1.f.com:"
curl server1.f.com

echo
echo "server1.f.com/owndir/:"
curl server1.f.com/owndir/

echo
echo "https://server1.f.com"
curl -k https://server1.f.com

echo
echo "vh1.f.com:"
curl vh1.f.com

echo
echo "https://vh1.f.com:"
curl -k https://vh1.f.com

echo
echo "vh1.f.com/myapp:"
curl vh1.f.com/myapp
