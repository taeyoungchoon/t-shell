vboxmanage showvminfo $(vboxmanage list vms | cut -d '"' -f 2) | grep Nested
