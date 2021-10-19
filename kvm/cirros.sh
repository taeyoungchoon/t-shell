wget http://download.cirros-cloud.net/0.4.0/cirros-0.4.0-x86_64-disk.img
mv cirros-0.4.0-x86_64-disk.img cirros-0.4.0-x86_64-disk.qcow2
qemu-img info  cirros-0.4.0-x86_64-disk.qcow2
virsh vol-create-as images cirros-image.qcow2 128M --format qcow2
virsh vol-upload cirros-image.qcow2 cirros-0.4.0-x86_64-disk.qcow2 --pool images
qemu-img info cirros-image.qcow2
ip a s dev virbr0
cat /var/lib/libvirt/dnsmasq/default.conf
virt-install   --name test-instance   --memory 512   --vcpus 1   --import   --disk=/var/lib/libvirt/images/cirros-image.qcow2,format=qcow2,bus=virtio --network network=default --graphics vnc,keymap=local --noautoconsole
