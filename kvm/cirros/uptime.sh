IP=$(virsh domifaddr ci0 | grep / | awk '{ print $4 }' | cut -d '/' -f 1)
sshpass -p gocubsgo ssh -o StrictHostKeyChecking=no cirros@${IP} uptime
