# Set-ExecutionPolicy RemoteSigned

chcp 437
arp -d
ping -n 1 8.8.8.8

while ($true) {
      get-date;
      arp -a | findstr dynamic;
      echo ""
      sleep 3;
}
