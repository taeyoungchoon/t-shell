IP=$(virsh domifaddr c0 | grep / | awk '{ print $4 }' | cut -d '/' -f 1)
sshpass -p 1234qwer ssh -o StrictHostKeyChecking=no root@${IP} uptime
