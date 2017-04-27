echo "FOODB 192.168.1.100" >> list.txt
sqlplus system/manager@FOODB_192.168.1.100 @tablespace_usage
