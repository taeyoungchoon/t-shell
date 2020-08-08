cat cloudera.sh 
for ip in 62 63 64 82 83 84 85 86 87 91 92 93 101 102
do
    sshpass -p '123$qwer' ssh -o "StrictHostKeyChecking=no" 112.$ip "echo -start--;hostname; $1"
    # sshpass -p '123$qwer' ssh -o "StrictHostKeyChecking=no" 112.41 "curl http://112.71/ansible/install.sh | sh; hostname"
done
