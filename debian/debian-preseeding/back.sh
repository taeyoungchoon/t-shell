virt-install --connect qemu:///system \
  --name vm --ram 4096 \
  --disk path=./vm.qcow2,size=8,format=qcow2 \
  --location 'http://archive.ubuntu.com/ubuntu/dists/trusty/main/installer-amd64/' \
  --network user,model=virtio \
  --initrd-inject preseed.cfg \
  --extra-args="ks=file:/preseed.cfg console=tty0 console=ttyS0,115200"
