$ORIGIN foo.com.
$TTL 3600
@             IN  SOA   ns.foo.com. hostmaster.foo.com. ( 2020111645 7200 3600 1209600 3600 )
              IN  NS    ns1
              IN  MX    10 mail
              IN  A     192.168.99.110
ns1           IN  A     192.168.99.110
mail          IN  A     192.168.99.110
www           IN  CNAME foo.com.
